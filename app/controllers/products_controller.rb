class ProductsController < ApplicationController
  def index
    @product = Product.first
  end

  def products
    @products = Product.all
  end
end
