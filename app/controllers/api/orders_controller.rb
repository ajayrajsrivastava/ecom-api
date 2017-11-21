module Api

	class OrdersController < ApplicationController

		before_action :restrict_access
		before_action :get_current_order, except: [:create]

		def create

			begin

				str = params[:items].to_json
				arr = JSON.parse(str)
				@current_order = Order.create(user_id: @current_user.id)

				arr.each do |item|
					odt = OrderDetail.create(order_id: @current_order.id, product_id: item["product_id"],quantity: item["quantity"])
		
					if !odt.errors.empty?
						raise "Insufficient Items"
					end

				end

				show()

			rescue
				render json: {"status" => "failure"}, status: 400
			end

		end
		
		
		def update

			begin
				element = @current_order.order_details.where(id: params[:order_detail_id])[0]
				element.destroy
				
				@current_order.order_details << OrderDetail.new(order_id: params[:order_id], product_id: params[:product_id], quantity: params[:quantity])

				show()
			rescue
				render json: {"status" => "failure"}, status: 400
			end

		end

		
		def delivered
		
			begin
				@current_order.delivered = true
				@current_order.save
				show()
			rescue
				render json: {"status" => "failure"}, status: 400
			end
		
		end

		
		def show()
		
			if @current_order
				render json: @current_order
			else
				render json: {"status" => "failure"}, status: 400
			end
		
		end
	
	end

end
