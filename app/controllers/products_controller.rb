class ProductsController < ApplicationController
  
  def home
    @product = Product.first
  end

  def index
    @products = Product.all
  end

  def inventory
    @products = Product.all
  end

  def new
    
  end

  def create
    @product = Product.create({name: params[:name], image: params[:image], description: params[:description], price: params[:price], inventory: params[:inventory]})

    flash[:success] = "New Product Created"

    redirect_to "/products"
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

    @product.update({name: params[:name], image: params[:image], description: params[:description], price: params[:price], inventory: params[:inventory]})

    flash[:info] = "Product Updated"

    redirect_to "/products/#{@product.id}"
  end

  def destroy
    @product = Product.find(params[:id])

    @product.destroy

    flash[:danger] = "Product Deleted"

    redirect_to '/'
  end

end
