# == Schema Information
#
# Table name: wholesalers
#
#  id           :bigint           not null, primary key
#  company_name :string(255)
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
class Wholesaler < ApplicationRecord
  has_many :wines
end
