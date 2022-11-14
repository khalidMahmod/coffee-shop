class Item < ApplicationRecord

  has_many :cart_items
  STATUSES = %w[active inactive]

  validates :name, :price, presence: true
  validates :status, inclusion: { in: STATUSES }
end
