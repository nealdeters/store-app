class CartedProductsController < ApplicationController
  def index
    @carted_products = CartedProduct.all
  end

  def create
    @carted_product = CartedProduct.create({quantity: params[:quantity], product_id: params[:product_id], user_id: current_user.id, status: "carted" })

    flash[:success] = "Added to Cart"

    redirect_to "/carted_products"
  end

  def edit
    @carted_product = CartedProduct.find(params[:id])
  end

  def update
    @carted_product = CartedProduct.find(params[:id])

    @carted_product.update({quantity: params[:quantity], product_id: params[:product_id], user_id: current_user.id })

    flash[:info] = "Cart Updated"

    # redirect_to "/products/#{@product.id}"
    render :index
  end

  def remove
    @carted_product = CartedProduct.find(params[:id])

    @carted_product.status = "removed"

    flash[:danger] = "Product Removed"

    render :index
  end
end