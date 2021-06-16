# == Schema Information
#
# Table name: wholesalers
#
#  id           :bigint           not null, primary key
#  company_name :string(255)
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
require 'rails_helper'

RSpec.describe Wholesaler, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
