class CreateMenuItems < ActiveRecord::Migration
  def change
    create_table :menu_items do |t|
      t.string :item_name
      t.float :item_cost
      t.text :desc
      t.text :ingredient_list

      t.timestamps null: false
    end
  end
end
