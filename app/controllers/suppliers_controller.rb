class SuppliersController < ApplicationController
  def index
    @suppliers = Supplier.all
  end

  def new

  end

  def create
    @supplier = Supplier.create({name: params[:name], image: params[:image], description: params[:description], price: params[:price], inventory: params[:inventory]})

    flash[:success] = "New Supplier Created"

    redirect_to "/suppliers"
  end

  def edit
    @supplier = Supplier.find(params[:id])
  end

  def update
    @supplier = Supplier.find(params[:id])

    @supplier.update({name: params[:name], image: params[:image], description: params[:description], price: params[:price], inventory: params[:inventory]})

    flash[:info] = "Supplier Updated"

    # redirect_to "/products/#{@product.id}"
    render :show
  end

  def destroy
    @supplier = Supplier.find(params[:id])

    @supplier.destroy

    flash[:danger] = "Supplier Deleted"

    redirect_to '/'
  end
end
