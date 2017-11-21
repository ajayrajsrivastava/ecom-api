module Api

	class PaymentsController < ApplicationController
		before_action :restrict_access,:get_current_order

		def received
			
			begin
				@current_order.payment = "received"
				@current_order.save
				render json: @current_order , status: 200
			rescue
				render json: {"status" => "failure"}, status: 400
			end

		end

		def refund
			
			begin

				if @current_order.delivered
					#raise "Order delivered, cannot refund now"
					render json: {message: "Order delivered, cannot refund now"}, status: 400
				else
					
					@current_order.payment = "refund_initiated"
					@current_order.save
					
					render json: @current_order , status: 200
				end
			
			rescue
				render json: {"status" => "failure"}, status: 400
			end
			
		end

	end


end