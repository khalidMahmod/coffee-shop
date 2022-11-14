class Order < ApplicationRecord
  belongs_to :cart
  has_one :order_notification

  before_create :set_status

  def set_status
    self.status ||= 'Preparing'
  end
end
