# == Schema Information
#
# Table name: wines
#
#  id             :bigint           not null, primary key
#  comment        :text(65535)
#  memo           :text(65535)
#  onlist         :boolean          default(FALSE)
#  purchase_price :integer
#  selling_price  :integer
#  state          :string(255)
#  stock          :integer          not null
#  vintage        :integer
#  wine_name      :string(255)      not null
#  wine_name_kana :string(255)
#  wine_type      :string(255)      not null
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  country_id     :integer
#  grape_id       :bigint
#  shop_id        :bigint           not null
#  wholesaler_id  :bigint
#  winary_id      :bigint
#
# Indexes
#
#  index_wines_on_grape_id       (grape_id)
#  index_wines_on_shop_id        (shop_id)
#  index_wines_on_wholesaler_id  (wholesaler_id)
#  index_wines_on_winary_id      (winary_id)
#
# Foreign Keys
#
#  fk_rails_...  (grape_id => grapes.id)
#  fk_rails_...  (shop_id => shops.id)
#  fk_rails_...  (wholesaler_id => wholesalers.id)
#  fk_rails_...  (winary_id => winaries.id)
#
FactoryBot.define do
  factory :wine do
    
  end
end
