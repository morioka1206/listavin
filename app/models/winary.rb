# == Schema Information
#
# Table name: winaries
#
#  id               :bigint           not null, primary key
#  winary_name      :string(255)
#  winary_name_kana :string(255)
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#
class Winary < ApplicationRecord
  has_many :wines
end
