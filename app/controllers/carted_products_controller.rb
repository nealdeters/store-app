class CartedProductsController < ApplicationController
  def index
    if user_signed_in? && current_user.carted_products.where(status: "Carted").any?
      @carted_products = current_user.carted_products.where(status: "Carted")
    else
      flash[:warning] = "No products have been added to your cart."
      redirect_to "/products"
    end 
    # @carted_products = CartedProduct.where(status: "Carted", user_id: current_user.id)
  end

  def create
    if current_user
      @carted_product = CartedProduct.create({quantity: params[:quantity], product_id: params[:product_id], user_id: current_user.id, status: "Carted" })

      flash[:success] = "Added to Cart"

      redirect_to "/carted_products"
    else
      flash[:info] = "Need to sign in to add products to your cart"
      redirect_to "/users/sign_in"
    end
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

  def destroy
    carted_product = CartedProduct.find(params[:id])

    carted_product.update(status: "Removed")

    flash[:danger] = "Product Removed"

    redirect_to "/carted_products"
  end
end
