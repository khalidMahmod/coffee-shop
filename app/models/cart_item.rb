class CartItem < ApplicationRecord
  belongs_to :cart
  belongs_to :item

  validates :item_id, :quantity, presence: true
  validates :item_id, uniqueness: { scope: [:cart_id] }

  after_create :create_discount

  def create_discount
    discounts = Rails.cache.fetch("discounts", expires_in: 24.hours) do
      Discount.all.map do |d|
        {
            id: d.id,
            ids: d.item_ids.split(',').map(&:to_i),
            rate: d.discount_rate
        }
      end
    end
    create_cart_discount(discounts)
  end

  def create_cart_discount(discounts)
    available_discounts = []
    discounts.each do |disc|
      available_discount_ids = available_discounts.map{|av| av[:ids]}.flatten
      if ((disc[:ids] & self.cart.cart_items.map(&:item_id)).size == disc[:ids].size) && available_discount_ids.none? {|a| disc[:ids].flatten.include? a }
        available_discounts << disc
        self.cart.cart_discounts.create(discount_id: disc[:id])
      end
    end
  end
end
