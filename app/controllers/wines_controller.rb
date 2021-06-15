class WinesController < ApplicationController
  require 'active_support'
  require 'active_support/core_ext'

  # before_action :wine_params, only: [:show, :update, :edit, :delete]
  include Pagy::Backend
  before_action :set_q, only: [:index, :search, :copy]
  before_action :onlist_set_q, only: [:winelist, :winelist_search]
  before_action :shop_name

  def index
    @q = Wine.ransack(params[:q])
    # @pagy, @wines = pagy(Wine.all)
    @pagy,@wines = pagy(@q.result, items: 30)
   
    
  end

  def winelist
    @pagy,@wines = pagy(@q.result, items: 8)
  end

  def winelist_search
    @pagy, @results = pagy(@q.result, items: 8)
  end

  def search
    @pagy, @results = pagy(@q.result, items: 30)
  end

  def copy
    wine = Wine.find(params[:id])
    
    wine = wine.deep_dup
    if wine.save
      redirect_to wines_index_path, notice: "コピーしました。"
    else
      flash.now[:alert] = "コピーに失敗しました。"
      render :index
    end
  end

  def new
    @wine = WineForm.new
  end

  def create
    @wine = WineForm.new(wine_params)
    if @wine.save
      redirect_to wines_index_path, notice: "新規作成しました。"
    else
      flash.now[:alert] = "記入漏れがあります。入力してください。"
      render :new
    end
  end

  def edit
    wine = Wine.find(params[:id])
    wine_form = WineForm.new
    @wine = wine_form.set_attributes(wine)
    
  end

  def show
    @wine = Wine.find(params[:id])
    cost =@wine.purchase_price / @wine.selling_price.to_f
    @cost = (cost * 100).floor
  end

  def update
    
    wine = Wine.find(params[:id])
    @wine = WineForm.new(update_wine_params)
    
      if @wine.update
        redirect_to wines_index_path, notice: "更新しました。"
      else
        flash.now[:alert] = "記入漏れがあります。入力してください。"
        render 'edit'
      end
  end

  def destroy
    wine = Wine.find(params[:id])
    if wine.destroy!
      redirect_to wines_index_path, notice: "削除しました。"
    else
      flash.now[:alert] = "削除できませんでした。"
      render "index"
    end
  end
  
  
  

  private

  def set_q
    @q = Wine.ransack(params[:q])
  end
  
  def onlist_set_q
    @q = Wine.where("onlist = true and stock >=  1").ransack(params[:q])
  end

  def wine_params
    params.permit(:grape_name, :winary_name, :winary_name_kana, :company_name, :wine_name, :wine_name_kana, :vintage, :comment, :purchase_price,:memo,
      :selling_price, :stock, :onlist, :state, :country_id, :winary_id, :grape_id, :wine_id, :wholesaler_id, :grape_id, :wine_type).merge(shop_id: current_shop.id)
  end

  def update_wine_params
    params.require(:wine_form).permit(:grape_name, :winary_name, :winary_name_kana, :company_name, :wine_name, :wine_name_kana, :vintage, :comment, :purchase_price,:memo,
      :selling_price, :stock, :onlist, :state, :country_id, :winary_id, :grape_ids, :wine_id, :wholesaler_id, :grape_id, :wine_type).merge(shop_id: current_shop.id)
  end
  
  def shop_name
    @shop_name = current_shop.name
  end
  

end
