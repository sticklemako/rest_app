class CreateMenuItemCategories < ActiveRecord::Migration
  def change
    create_table :menu_item_categories do |t|
      t.references :menu_item
      t.references :category

      t.timestamps null: false
    end
    add_index :menu_item_categories, ["menu_item_id", "category_id"]
  end
end
