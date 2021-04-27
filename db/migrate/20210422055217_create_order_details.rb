class CreateOrderDetails < ActiveRecord::Migration[5.2]
  def change
    create_table :order_details do |t|
      t.integer :item_id, foreign_key: true, null: false
      t.integer :order_id, foreign_key: true, null: false
      t.integer :amount, null: false
      t.integer :status, null: false, default: 0
      t.integer :tax_price, null: false

      t.timestamps
    end
  end
end
