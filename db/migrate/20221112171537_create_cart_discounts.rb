class CreateCartDiscounts < ActiveRecord::Migration[6.1]
  def change
    create_table :cart_discounts do |t|
      t.references :cart, null: false, foreign_key: true
      t.references :discount, null: false, foreign_key: true

      t.timestamps
    end
  end
end
