class SessionsController < ApplicationController
  def new
  end

  def create
    shop = Shop.find_by(email: params[:email])
      if shop.present? && shop.authenticate(params[:password])
        session[:shop_id] = shop.id
        redirect_to wines_index_path
      else
        render :new
      end
  end
end
