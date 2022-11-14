class CreateDiscounts < ActiveRecord::Migration[6.1]
  def change
    create_table :discounts do |t|
      t.json :item_ids
      t.float :discount_rate

      t.timestamps
    end
  end
end
