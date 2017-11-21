class CreateOrders < ActiveRecord::Migration[5.1]
  def change
    create_table :orders do |t|
      t.references :user, index: true
      t.boolean :delivered, default: false
      t.string :payment, default: "pending"
      t.timestamps
    end
  end
end
