class CartDiscount < ApplicationRecord
  belongs_to :cart
  belongs_to :discount

  validates :discount_id, uniqueness: { scope: [:cart_id] }
end
