class ItemOrder < ActiveRecord::Base
	belongs_to :menu_item
	belongs_to :order

	accepts_nested_attributes_for :menu_item, :allow_destroy => true
	accepts_nested_attributes_for :order, :allow_destroy => true
end
