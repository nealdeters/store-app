class ProductsController < ApplicationController
  
  def home
    @product = Product.first
  end

  def index
    @products = Product.all
  end

  def new
    
  end

  def create
    @product = Product.create({name: params[:name], image: params[:image], description: params[:description], price: params[:price]})
  end

  def show
    #@product = Product.find_by(id: params[:id])
    @product = Product.find(params[:id])
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])

    @product.update({name: params[:name], image: params[:image], description: params[:description], price: params[:price]})
  end

  def destroy
    @product = Product.find(params[:id])

    @product.destroy
  end

end
