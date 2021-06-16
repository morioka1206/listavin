class ApplicationController < ActionController::Base
  include SessionsHelper
  helper_method :current_shop
  before_action :login_required


  def ensure_correct_user
    if @current_shop.id != params[:id].to_i
    flash[:alert] = "権限がありません"
    redirect_to wines_top_path
   end
  end

  private

  def current_shop
    @current_shop ||= Shop.find_by(id: session[:shop_id] ) if session[:shop_id]
  end

  def login_required
    redirect_to login_path unless current_shop
  end


end