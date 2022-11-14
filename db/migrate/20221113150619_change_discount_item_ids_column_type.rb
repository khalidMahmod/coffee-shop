class ChangeDiscountItemIdsColumnType < ActiveRecord::Migration[6.1]
  def change
    change_column :discounts, :item_ids, :string
  end
end
