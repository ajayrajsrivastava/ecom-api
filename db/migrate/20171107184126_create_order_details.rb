class CreateOrderDetails < ActiveRecord::Migration[5.1]
  def change
    create_table :order_details do |t|
      t.references :order, index: true
      t.references :product, index: true
      t.integer :quantity
      t.timestamps
    end
  end
end
