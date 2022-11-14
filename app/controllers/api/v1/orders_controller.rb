class Api::V1::OrdersController < ApplicationController

  def create
    order = Order.new(order_params)

    if order.save
      session[:cart_id] = nil

      render json: order
    else
      render json: {error: order.errors.full_messages}
    end
  end

  def update
    order = Order.find params[:id]

    if order.update(order_params)
      render json: order
    else
      render json: { error: order.errors.full_messages }
    end
  end

  def notifications
    orders = Order.where(status: %w[Preparing Ready])

    render json: orders.group_by(&:status).map{|key, value|  { key => value.map(&:id)} }
  end

  private

  def order_params
    params.require(:order).permit(:cart_id, :status)
  end
end