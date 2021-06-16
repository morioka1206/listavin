# == Schema Information
#
# Table name: grapes
#
#  id         :bigint           not null, primary key
#  grape_name :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
require 'rails_helper'

RSpec.describe Grape, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
