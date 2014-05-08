class ChargesController < ApplicationController

	def new
	end

	def create
	  @user = current_user
	  if @user.create_customer(params[:stripeToken])
	  	
	  end
	  	# redirect_to root_url, notice: "You have successfully created a subscription account!"
	  else
	  	redirect_to :back, notice: "An error occurred and we were unable to process your credit card. Please make sure you've entered all the correct information and try again."
	  end
	end

end
