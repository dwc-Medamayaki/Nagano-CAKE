class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.integer :customer_id, null: false, foreign_key: true
      t.string :send_post_code, null: false
      t.string :send_address, null: false
      t.string :send_name, null: false
      t.integer :status, null: false, default: 0
      t.integer :total_payment, null: false
      t.integer :pay_method, null: false, default: 0
      t.integer :postage, null: false

      t.timestamps
    end
  end
end
