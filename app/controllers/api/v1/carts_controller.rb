class Api::V1::CartsController < ApplicationController
  def add
    puts "===CART: #{current_cart.inspect}"
    current_cart.cart_items.create!(cart_item_params)
    render json: current_cart, serializer: CartSerializer
  end

  def show
    cart = Cart.find params[:id]
    render json: cart
  end

  private

  def cart_item_params
    params.permit(:quantity, :item_id)
  end
end