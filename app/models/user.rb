class User < ApplicationRecord
	
	before_create :generate_api_key	

	#validates :email, uniqueness: true
	#validates :name, uniqueness: true

	has_many :orders

	private
	

	def generate_api_key
		
		begin
		self.api_key = SecureRandom.hex.to_s
		end while self.class.exists?(api_key: api_key)

	end

end
