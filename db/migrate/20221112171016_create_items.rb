class CreateItems < ActiveRecord::Migration[6.1]
  def change
    create_table :items do |t|
      t.string :name
      t.float :tax_rate
      t.string :status
      t.float :price

      t.timestamps
    end
  end
end
