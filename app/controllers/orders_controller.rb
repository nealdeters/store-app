class OrdersController < ApplicationController

  def create

    # product_id = Product.find(params[:product_id])
    price = Product.find(params[:product_id]).price
    
    # @order = Order.create({product_id: params[:product_id], quantity: params[:quantity], user_id: current_user.id, subtotal: params[:subtotal], tax: params[:tax], total: params[:total]})

    @order = Order.new({product_id: params[:product_id], quantity: params[:quantity], user_id: current_user.id})

    
    @order.subtotal = @order.calc_subtotal(price)
    @order.tax = @order.calc_tax(0.09)
    @order.total = @order.calc_total

    @order.save

    redirect_to "/orders/#{@order.id}"

  end

  def show
    @order = Order.find(params[:id])
  end

end
