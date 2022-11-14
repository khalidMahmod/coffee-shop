class Api::V1::DiscountsController < ApplicationController
  def create
    discount = Discount.create(discount_params)
    render json: discount
  end

  private

  def discount_params
    params.permit(:discount_rate, :item_ids)
  end
end