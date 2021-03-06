class ProductsController < ApplicationController
  
  before_action :authenticate_admin!, except: [:home, :index, :show, :random, :search]

  def home
    @product = Product.first 
  end

  def index

    cart_count

    @products = Product.all

    if params[:filter] && params[:filter_order]
      @products = Product.order(params[:filter] => params[:filter_order])
    end
    if params[:discount]
      @products = @products.where("price < ?", params[:discount])
    end
    if params[:filter] == "sale"
      @products = Product.where("price < ?", 200)
    end
    if params[:filter] == "random"
      @product = Product.all.sample
      # redirect_to "/products/#{@product.id}"
      render :show
    end
    if params[:category]
      @products = Category.find_by(name: params[:category]).products
    end

  end

  def inventory
    unless current_user.admin
      redirect_to "/"
    else
      @products = Product.all 
    end
    
  end

  def new
    @product = Product.new
  end

  def create
    

    @product = Product.new({name: params[:name], description: params[:description], price: params[:price], supplier_id: params[:supplier][:supplier_id], inventory: params[:inventory], })

    if @product.save

      Image.create(image_url: params[:image], product_id: @product.id) if params[:image] != ""

      flash[:success] = "New Product Created"

      redirect_to "/products"
    else
      render :new
    end
  end

  def show
    #@product = Product.find_by(id: params[:id])
    @product = Product.find(params[:id])

  end

  def edit
    @product = Product.find(params[:id])

    # @image = Product.find(params[:id]).images.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])

    @product.update({name: params[:name], description: params[:description], price: params[:price], inventory: params[:inventory]})

    Image.update(image_url: params[:image][:image_url], product_id: @product.id)

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
