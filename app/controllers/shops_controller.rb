class ShopsController < ApplicationController
  skip_before_action :login_required

  def new
    @shop = Shop.new
  end
  
  def create
    @shop = Shop.new(shop_params)
    if @shop.save
      redirect_to login_path, notice: "店舗を作成しました。"
    else
      flash.now[:alert] = '店舗の作成に失敗しました'
      render :new
    end
  end

  private

  def shop_params
    params.require(:shop).permit(:name, :email, :password, :password_confirmation)
  end
end
