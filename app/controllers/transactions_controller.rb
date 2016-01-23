class TransactionsController < ApplicationController
	before_action :authenticate_user!
	before_action :check_cart!

    def new
    	gon.client_token = generate_client_token
    end

	private

	def generate_client_token
		Braintree::ClientToken.generate
	end

	def check_cart!
		if cart.blank?
			redirect_to store_url
		end
	end
end
