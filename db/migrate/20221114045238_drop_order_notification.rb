class DropOrderNotification < ActiveRecord::Migration[6.1]
  def change
    drop_table :order_notifications
  end
end
