class CreateProducts < ActiveRecord::Migration[5.1]
  def change
    create_table :products do |t|
      t.string :name
      t.integer :price
      t.string :category
      t.integer :quantity_left
      t.timestamps
    end
  end
end
