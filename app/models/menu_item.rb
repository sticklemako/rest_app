class MenuItem < ActiveRecord::Base
	has_many :item_orders
	has_many :orders, :through => :item_orders

	accepts_nested_attributes_for :item_orders, :allow_destroy => true
end
