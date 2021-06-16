# == Schema Information
#
# Table name: shops
#
#  id              :bigint           not null, primary key
#  email           :string(255)      not null
#  name            :string(255)      not null
#  password_digest :string(255)      not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
# Indexes
#
#  index_shops_on_email  (email) UNIQUE
#
class Shop < ApplicationRecord
  has_secure_password 
  has_many :wines
end
