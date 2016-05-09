class Customer < ActiveRecord::Base
	has_many :reservations

	accepts_nested_attributes_for :reservations
end
