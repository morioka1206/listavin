module SessionsHelper
  def log_out
    session.delete(:shop_id)
    @current_shop = nil
  end

  def logged_in?
    !current_shop.nil?
  end
end
