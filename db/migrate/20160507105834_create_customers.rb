class CreateCustomers < ActiveRecord::Migration
  def change
    create_table :customers do |t|
      t.string :name
      t.text :addrline1
      t.string :addr_city
      t.string :addr_state
      t.string :addr_country
      t.string :addr_pincode
      t.string :phone_no
      t.text :note

      t.timestamps null: false
    end
  end
end
