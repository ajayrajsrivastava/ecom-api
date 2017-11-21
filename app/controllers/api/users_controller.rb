module Api
	class UsersController < ApplicationController

		before_action :restrict_access, except: :create
		
		def create

			@current_user = (params[:username] and params[:email]) ? User.create(name: params[:username], email: params[:email]) : nil


			if @current_user
				render json: @current_user, status: 200
			else
				render json: { status: 'failure', message: 'Both username & email required to register user'}, status: 400
			end
			
		end

		def orders
			@current_orders = @current_user.orders
			render json: @current_orders, status: 200, root: "orders" #since we are in users controller 
		end


		private 
			def user_params
				params.permit(:username,:email)
			end

	end
end