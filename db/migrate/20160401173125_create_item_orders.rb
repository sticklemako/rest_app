class CreateItemOrders < ActiveRecord::Migration
  def change
    create_table :item_orders do |t|
      t.references :menu_item
      t.references :order
      t.text :note
      t.integer :quantity

      t.timestamps null: false
    end
    add_index :item_orders, ["menu_item_id", "order_id"]
  end
end
