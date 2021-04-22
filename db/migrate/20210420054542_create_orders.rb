class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.integer :end_user_id
      t.integer :payment_method, null: false, default: 0
      t.integer :status, null: false, default: 0
      t.string :postcode, null: false
      t.string :address, null: false
      t.string :name, null: false
      t.integer :shipping_cost, default: 600
      t.integer :total_payment, null: false
      t.integer :status, null: false, default: 0

      t.timestamps
    end
  end
end
