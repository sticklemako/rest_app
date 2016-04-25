json.array!(@menu_items) do |menu_item|
  json.extract! menu_item, :id, :item_name, :item_cost, :desc, :ingredient_list
end