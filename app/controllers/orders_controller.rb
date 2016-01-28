class OrdersController < ApplicationController

  def create
    @order = Order.create({product_id: params[:product_id], quantity: params[:quantity], user_id: current_user.id})

    redirect_to "/orders/#{@order.id}"

  end

  def show
    @order = Order.find(params[:id])
  end

end
