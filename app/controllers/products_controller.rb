class ProductsController < ApplicationController
  
  def home
    @product = Product.first
  end

  def index
    
    if params[:filter]
      if params[:filter] == "lowest"
        @products = Product.order(params[:price])
      elsif params[:filter] == "highest"
        @products = Product.order(price: :desc)
      elsif params[:filter] == "discount"
        @products = Product.where("price < ?", 200)
      elsif params[:filter] == "random"
        @product = Product.all.sample
        redirect_to "/products/#{@product.id}"
        # render :show
      end
    else
      @products = Product.all 
    end

    # @products = Product.all
    # if params[:sort] && params[:sort_order]
    #   @product = Product.order(params[:sort]) => 
    # end

    # if params[:discount]
    #   @products = @products.where("price < ?", params[:discount])
    # end

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

    # redirect_to "/products/#{@product.id}"
    render :show
  end

  def destroy
    @product = Product.find(params[:id])

    @product.destroy

    flash[:danger] = "Product Deleted"

    redirect_to '/'
  end

  def search
    @products = Product.where("name LIKE ? OR description LIKE ?", "%#{params[:search]}%", "%#{params[:search]}%")

    render :index
  end

end
