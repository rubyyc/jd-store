class Cart < ApplicationRecord
  has_many :cart_items
  has_many :products, through: :cart_items, source: :product

  def add_product_to_cart(product)
    if product.is_hide?
      flash[:alert] = "该商品已下架, 无法加入购物车"
      redirect_to root_path
    end

    # cart_items.find_by(product_id, product.id)
    # flash[:alert] = "该商品已下3架, 无法加入购物车"

    c = cart_items.build
    c.product = product
    c.quantity = 1
    c.save
  end

  def total_price
    sum = 0
    cart_items.each do |cart_item|
      if cart_item.product.price.present?
        sum += cart_item.quantity * cart_item.product.price
      end
    end
    sum
  end

  def clean!
    cart_items.destroy_all
  end
end
