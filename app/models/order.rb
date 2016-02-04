class Order < ActiveRecord::Base
  validates :user_id, presence: true
  validates :user_id, numericality: true

  validates :subtotal, presence: true
  validates :subtotal, format: { with: /\A\d+(?:\.\d{0,2})?\z/ }
  validates :subtotal, numericality: { greater_than: 0 }

  validates :tax, presence: true
  validates :tax, format: { with: /\A\d+(?:\.\d{0,2})?\z/ }
  validates :tax, numericality: { greater_than: 0 }

  validates :total, presence: true
  validates :total, format: { with: /\A\d+(?:\.\d{0,2})?\z/ }
  validates :total, numericality: { greater_than: 0 }

  validates :status, presence: true
  validates :status, inclusion: { in: %w(Carted Removed Purchased)

  belongs_to :user
  has_many :carted_products
  has_many :products, through: :carted_products

  def calculate_totals
    
    subtotal = 0

    carted_products.each do |carted_product|
      subtotal += carted_product.subtotal
    end

    tax = subtotal * 0.09
    total = subtotal + tax

    update(subtotal: subtotal, tax: tax, total: total)

  end

end
