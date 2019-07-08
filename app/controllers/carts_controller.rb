class CartsController < ApplicationController
  before_action :authenticate_user!
  def index

  end

  def clean
    current_cart.clean!
    flash[:warning] = "购物车清除成功"
    redirect_to carts_path
  end
end
