class Order < ActiveRecord::Base
	has_many :item_orders
	has_many :menu_items, :through => :item_orders

	accepts_nested_attributes_for :item_orders, :allow_destroy => true
	accepts_nested_attributes_for :menu_items
end
