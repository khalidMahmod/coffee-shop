class CreateCarts < ActiveRecord::Migration[6.1]
  def change
    create_table :carts do |t|
      t.float :sub_total
      t.float :tax
      t.float :total

      t.timestamps
    end
  end
end
