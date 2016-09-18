class CreateOrders < ActiveRecord::Migration[5.0]
  def change
    create_table :orders do |t|
      t.integer :users_id
      t.integer :product_id
      t.float :total
    end
    add_index :orders, :users_id
    add_index :orders, :product_id
  end
end
