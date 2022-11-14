class Api::V1::OrdersController < ApplicationController

  def create
    order = Order.new(order_params)

    if order.save
      session[:cart_id] = nil

      render json: order
    else
      render json: {error: 'There was an error!'}
    end
  end

  private

  def order_params
    params.require(:order).permit(:cart_id, :status)
  end
end