class Order < ApplicationRecord
  belongs_to :cart

  before_create :set_status

  validates :status, inclusion: { in: %w[Preparing Ready Cancelled Delivered]}

  def set_status
    self.status ||= 'Preparing'
  end
end
