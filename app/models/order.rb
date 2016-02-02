class Order < ActiveRecord::Base
  belongs_to :product
  belongs_to :user
  has_many :products, through: :carted_products

  def calc_subtotal(price)
    price * quantity
  end

  def calc_tax(tax_rate)
    subtotal * tax_rate
  end

  def calc_total
    subtotal + tax
  end

end
