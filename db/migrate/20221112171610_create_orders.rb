class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.references :cart, null: false, foreign_key: true
      t.string :status

      t.timestamps
    end
  end
end
