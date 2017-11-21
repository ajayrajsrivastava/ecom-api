class OrderDetail < ApplicationRecord

	belongs_to :order
	belongs_to :product

	validate :valid_quantity

	after_create :reduce_quantity
	before_destroy :restore_quantity


	private

	def valid_quantity
		
		if quantity > Product.find_by_id(product_id).quantity_left
			errors.add(:quantity,"invalid quantity")
		end

	end	

	def reduce_quantity
		Product.find_by_id(product_id).decrement(:quantity_left,quantity).save
	end

	def restore_quantity
		Product.find_by_id(product_id).increment(:quantity_left,quantity).save
	end

end
