class MenuItem < ActiveRecord::Base
	has_many :item_orders
	has_many :orders, :through => :item_orders
	has_many :menu_item_categories
	has_many :categories, :through => :menu_item_categories

	accepts_nested_attributes_for :item_orders, :allow_destroy => true
	accepts_nested_attributes_for :menu_item_categories, :allow_destroy => true
end
