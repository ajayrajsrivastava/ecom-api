module Api
	class ProductsController < ApplicationController

		before_action :restrict_access

		def index
			
			if(params[:product_id])
				begin
					render json: Product.find_by_id(params[:product_id])			
				rescue
					render json: {"status" => "failure"} , status: 400
				end
			else
				render json: Product.all, status: 200
			end

		end

		def create

			begin
				product = Product.create(product_params)
				render json: product ,status: 200
			rescue
				render json: {"status" => "failure"}, status: 400
			end
			
		end
	

		private
		  def product_params
		  	params.permit(:name,:price,:quantity_left,:category)
		  end 
	
	end
end