class CartedProduct < ActiveRecord::Base
  belongs_to :order
  belongs_to :product
  belongs_to :user

  def image
    product.images.first.image_url
  end

  def subtotal
    product.price * quantity
  end
end
