class ChargesController < ApplicationController
	before_action :signed_in_user
	# before_filter :correct_user

	def new
	end

	def create
	  @user = current_user
	  if @user.create_customer(params[:stripeToken])
	  	redirect_to root_url, notice: "You have successfully created a subscription account!"
	  else
	  	redirect_to :back, notice: "An error occurred and we were unable to process your credit card. Please make sure you've entered all the correct information and try again."
	  end
	end

	private

	# def correct_user
 #    @company = current_user.companies.find_by(id: params[:id])
 #    redirect_to root_url if @company.nil?
 #  end

end
