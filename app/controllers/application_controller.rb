class ApplicationController < ActionController::API

	def restrict_access
		
		unless restrict_access_by_params and restrict_access_by_header
			render json: { status: 'Unauthorized access', message: 'Invalid or expired api key'}, status: 401
		end

	end

	def restrict_access_by_header
		
		return true if @current_user
		
		authenticate_or_request_with_http_token do |api_key, options|
      		if @current_user = User.find_by(api_key: api_kexy)
				return true
			else
				return false
			end
		end

	end

	def restrict_access_by_params
		
		return true if @current_user
			
		
		if @current_user = User.find_by(api_key: params[:api_key])
			return true
		else
			return false
		end
		
	end

	def get_current_order
    	@current_order ||= Order.find_by(id: params[:order_id], user_id: @current_user.id)
  	end

end
