# frozen_string_literal: true

require 'time'
require 'net/http'

module Aws
  # A client that can query version 2 of the EC2 Instance Metadata
  class EC2Metadata
    # Path for PUT request for token
    # @api private
    METADATA_TOKEN_PATH = '/latest/api/token'.freeze

    # Raised when the PUT request is not valid. This would be thrown if
    # `token_ttl` is not an Integer.
    # @api private
    class TokenRetrievalError < RuntimeError; end

    # Token has expired, and the request can be retried with a new token.
    # @api private
    class TokenExpiredError < RuntimeError; end

    # The requested metadata path does not exist.
    # @api private
    class MetadataNotFoundError < RuntimeError; end

    # The request is not allowed or IMDS is turned off.
    # @api private
    class RequestForbiddenError < RuntimeError; end

    # Creates a client that can query version 2 of the EC2 Instance Metadata
    #   service (IMDS).
    #
    # @note Customers using containers may need to increase their hop limit
    #   to access IMDSv2.
    # @see https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/configuring-instance-metadata-service.html#instance-metadata-transition-to-version-2
    #
    # @param [Hash] options
    # @option options [Integer] :token_ttl (21600) The session token's TTL,
    #   defaulting to 6 hours.
    # @option options [Integer] :retries (3) The number of retries for failed
    #   requests.
    # @option options [String] :endpoint (169.254.169.254) The IMDS endpoint.
    # @option options [Integer] :port (80) The IMDS endpoint port.
    # @option options [Integer] :http_open_timeout (1) The number of seconds to
    #   wait for the connection to open.
    # @option options [Integer] :http_read_timeout (1) The number of seconds for
    #   one chunk of data to be read.
    # @option options [IO] :http_debug_output An output stream for debugging. Do
    #   not use this in production.
    # @option options [Integer,Proc] :backoff A backoff used for retryable
    #   requests. When given an Integer, it sleeps that amount. When given a
    #   Proc, it is called with the current number of failed retries.
    def initialize(options = {})
      @token_ttl = options[:token_ttl] || 21_600
      @retries = options[:retries] || 3
      @backoff = backoff(options[:backoff])

      @endpoint = options[:endpoint] || '169.254.169.254'
      @port = options[:port] || 80

      @http_open_timeout = options[:http_open_timeout] || 1
      @http_read_timeout = options[:http_read_timeout] || 1
      @http_debug_output = options[:http_debug_output]

      @token = nil
      @mutex = Mutex.new
    end

  
    def get(path)
      retry_errors(max_retries: @retries) do
        @mutex.synchronize do
          fetch_token unless @token && !@token.expired?
        end

        open_connection do |conn|
          http_get(conn, path, @token.value)
        end
      end
    end

    private

    def fetch_token
      open_connection do |conn|
        token_value, token_ttl = http_put(conn, @token_ttl)
        @token = Token.new(value: token_value, ttl: token_ttl)
      end
    end

    def http_get(connection, path, token)
      headers = {
        'User-Agent' => "aws-sdk-ruby3/#{CORE_GEM_VERSION}",
        'x-aws-ec2-metadata-token' => token
      }
      request = Net::HTTP::Get.new(path, headers)
      response = connection.request(request)

      case response.code.to_i
      when 200
        response.body
      when 401
        raise TokenExpiredError
      when 404
        raise MetadataNotFoundError
      end
    end

    def http_put(connection, ttl)
      headers = {
        'User-Agent' => "aws-sdk-ruby3/#{CORE_GEM_VERSION}",
        'x-aws-ec2-metadata-token-ttl-seconds' => ttl.to_s
      }
      request = Net::HTTP::Put.new(METADATA_TOKEN_PATH, headers)
      response = connection.request(request)

      case response.code.to_i
      when 200
        [
          response.body,
          response.header['x-aws-ec2-metadata-token-ttl-seconds'].to_i
        ]
      when 400
        raise TokenRetrievalError
      when 403
        raise RequestForbiddenError
      end
    end

    def open_connection
      http = Net::HTTP.new(@endpoint, @port, nil)
      http.open_timeout = @http_open_timeout
      http.read_timeout = @http_read_timeout
      http.set_debug_output(@http_debug_output) if @http_debug_output
      http.start
      yield(http).tap { http.finish }
    end

    def retry_errors(options = {}, &_block)
      max_retries = options[:max_retries]
      retries = 0
      begin
        yield
      # These errors should not be retried.
      rescue TokenRetrievalError, MetadataNotFoundError, RequestForbiddenError
        raise
      # StandardError is not ideal but it covers Net::HTTP errors.
      # https://gist.github.com/tenderlove/245188
      rescue StandardError, TokenExpiredError
        raise unless retries < max_retries

        @backoff.call(retries)
        retries += 1
        retry
      end
    end

    def backoff(backoff)
      case backoff
      when Proc then backoff
      when Numeric then ->(_) { Kernel.sleep(backoff) }
      else ->(num_failures) { Kernel.sleep(1.2**num_failures) }
      end
    end

    # @api private
    class Token
      def initialize(options = {})
        @ttl   = options[:ttl]
        @value = options[:value]
        @created_time = Time.now
      end

      # [String] Returns the token value.
      attr_reader :value

      # [Boolean] Returns true if the token expired.
      def expired?
        Time.now - @created_time > @ttl
      end
    end
  end
end
