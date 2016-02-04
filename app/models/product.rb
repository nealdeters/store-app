class Product < ActiveRecord::Base
  
  validates :name, presence: true
  validates :name, uniqueness: true
  validates :name, format: { with: /\A[a-zA-Z0-9]*\z/ }

  validates :price, presence: true
  validates :price, format: { with: /\A\d+(?:\.\d{0,2})?\z/ }
  validates :price, numericality: { greater_than: 0 }

  validates :supplier_id, presence: true
  validates :supplier_id, numericality: true

  belongs_to :supplier

  has_many :images

  has_many :carted_products
  has_many :orders, through: :carted_products

  has_many :categorized_products
  has_many :categories, through: :categorized_products

  def supplier_name
    supplier.name
  end

  def sale_message
    if price.to_i < 100
      "Discount item!"
    elsif price.to_i < 200
      "On Sale!"
    end 
  end

  def cost
    price
  end

  def sale_tax
    @tax = price * 0.09
    "#{@tax}"
  end

  def total_cost
    @total = price + @tax
    "#{@total}"
  end

  def in_stock?
    if inventory == 0 || inventory == nil
      "Out of stock."
    else
      "In Stock."
    end
  end

  def stock_class
    if inventory == 0 || inventory == nil
      "out_of_stock"
    else
      "in_stock"
    end
  end

  def buy_out_of_stock_class
    if inventory == 0 || inventory == nil
      "disabled"
    end
  end

  def out_of_stock_badge
    if inventory == 0 || inventory == nil
      '<span class="label label-danger out_of_stock-badge">SOLD OUT</span>'
    end
  end

  def on_sale_badge
    if price < 200
      '<span class="label label-info on_sale-badge">ON SALE</span>'
    end
  end

  def get_the_first_image
    if images.first
      images.first.image_url
    else
      Image.first.url
    end
  end

end
