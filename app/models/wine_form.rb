class WineForm
  include ActiveModel::Model
  include ActiveModel::Attributes
  attr_accessor :grape_name, :winary_name, :winary_name_kana, :company_name, :wine_name, :wine_name_kana, :vintage, :comment, :memo, :purchase_price,
  :selling_price, :stock, :onlist, :state, :country_id, :shop_id, :wine_id, :grape_id, :wholesaler_id, :winary_id, :wine_type


  def save
    ActiveRecord::Base.transaction do
      winary = Winary.find_or_create_by(winary_name: winary_name, winary_name_kana: winary_name_kana)
      wholesaler = Wholesaler.find_or_create_by(company_name: company_name)
      grape = Grape.find_or_create_by(grape_name: grape_name)
      wine = Wine.create(wine_name: wine_name, wine_name_kana: wine_name_kana, vintage: vintage, comment: comment, memo: memo, purchase_price: purchase_price, wine_type: wine_type,grape_id: grape.id,
      selling_price: selling_price, stock: stock, onlist: onlist, state: state, country_id: country_id, winary_id: winary.id, wholesaler_id: wholesaler.id, shop_id: shop_id)
    end
  end


  def update
    ActiveRecord::Base.transaction do
      winary=Winary.find_or_create_by(winary_name: winary_name, winary_name_kana: winary_name_kana)
      wholesaler= Wholesaler.find_or_create_by(company_name: company_name)
      grape=Grape.find_or_create_by(grape_name: grape_name)
      wine = Wine.find_by(id: wine_id)
      wine.update( wine_name: wine_name, wine_name_kana: wine_name_kana, vintage: vintage, comment: comment, memo: memo, purchase_price: purchase_price, wine_type: wine_type,
      selling_price: selling_price, stock: stock, onlist: onlist, state: state, country_id: country_id,grape_id: grape.id, winary_id: winary.id, wholesaler_id: wholesaler.id, shop_id: shop_id)
    end
  end
  
  def set_attributes(wine)
    self.wine_name = wine.wine_name
    self.wine_name_kana = wine.wine_name_kana
    self.selling_price = wine.selling_price
    self.purchase_price = wine.purchase_price
    self.vintage = wine.vintage
    self.stock = wine.stock
    self.country_id = wine.country_id
    self.state = wine.state
    self.comment = wine.comment
    self.memo = wine.memo
    self.wine_type = wine.wine_type
    self.onlist = wine.onlist
    self.winary_name = wine.winary.winary_name
    self.winary_name_kana = wine.winary.winary_name_kana
    self.company_name = wine.wholesaler.company_name
    self.grape_name = wine.grape.grape_name
    self.wine_id = wine.id
    self.wholesaler_id = wine.wholesaler_id
    self.shop_id = wine.shop_id
    self.winary_id = wine.winary_id
    self.grape_id = wine.grape_id
    self
  end

  def copy
    ActiveRecord::Base.transaction do
      winary = Winary.find_by(id: winary_id)
      winary.deep_dup
      wholesaler = Wholesaler.find_by(id: wholesaler_id)
      wholesaler.deep_dup
      grape = Grape.find_by(id: grape_id)
      grape.deep_dup
      wine = Wine.find_by(id: wine_id)
      wine.deep_dup
    end
  end
  

end