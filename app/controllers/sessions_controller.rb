class SessionsController < ApplicationController
  skip_before_action :login_required

  def new
  end

  def create
    shop = Shop.find_by(email: params[:email])
      if shop.present? && shop.authenticate(params[:password])
        session[:shop_id] = shop.id
        redirect_to wines_index_path, notice: "ログインしました。"
      else
        flash.now[:alert] = 'ログインに失敗しました。'
        render :new
      end
  end

  def destroy
    log_out if logged_in?
      redirect_to wines_top_path, notice: "ログアウトしました。"
  end
end