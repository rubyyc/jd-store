class Admin::ProductsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :update, :edit, :destroy, :publish, :hide]

  before_action :require_is_admin

  #skip_before_filter :verify_authenticity_token

  layout "admin"

  def index
    @products = Product.all.order('position ASC')
  end

  def new
    @product = Product.new
  end

  def show
    @product = Product.find(params[:id])
  end

  def create
    @product = Product.new(product_params)

    # respond_to do |format|

      if @product.save
        redirect_to admin_products_path, notice: '商品添加成功!'
       #   render :js => "dialog.success('商品添加成功!','#{ admin_products_path }')"
       # }
      else
        # format.js {
        #   render :js => "dialog.error('商品添加失败!','#{ admin_products_path }')"
        # }
        redirect_to admin_products_path, alert: '商品添加失败!'
      end
    # end
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])

    if @product.update(product_params)
      redirect_to admin_products_path, notice: '商品更新成功!'
    else
      redirect_to admin_products_path, alert: '商品更新失败!'
    end

  end

  def destroy
    @product = Product.find(params[:id])

    if @product.delete
      redirect_to admin_products_path, notice: '商品删除成功!'
    else
      redirect_to admin_products_path, alert: '商品删除失败!'
    end

  end

  def hide
    @product = Product.find(params[:id])
    @product.hide!

    redirect_to admin_products_path, notice: '商品下架成功!'
  end

  def publish
    @product = Product.find(params[:id])
    @product.publish!

    redirect_to admin_products_path, notice: '商品上架成功!'
  end

  def move_up
    @product = Product.find(params[:id])
    @product.move_higher

    redirect_to admin_products_path, notice: '商品上移成功!'
  end

  def move_down
    @product = Product.find(params[:id])
    @product.move_lower

    redirect_to admin_products_path, notice: '商品上移成功!'

  end

private
  def product_params
    params.require(:product).permit(:title, :price, :description, :quantity, :image)
  end
end
