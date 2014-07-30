class ChargesController < ApplicationController
	before_filter :authenticate_user!

	def new
	end

	def create
	@user = current_user

		if @user.create_customer(params[:stripeToken])
			redirect_to root_url, notice: "Thank you for subscribing! You're ready to start hiring!"
		else
			redirect_to :back, notice: "An error occurred and we were unable to process your credit card. Please make sure you've entered all the correct information and try again."
		end
	end

end
