class CreateReservations < ActiveRecord::Migration
  def change
    create_table :reservations do |t|
      t.references :customer
      t.datetime :time_start
      t.datetime :time_end
      t.integer :no_ppl
      t.string :type
      t.text :note

      t.timestamps null: false
    end
    add_index :reservations, ["customer_id"]
  end
end























