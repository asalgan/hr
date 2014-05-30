class HomeController < ApplicationController

	def index
		if user_signed_in?
			redirect_to current_company
		else
			render layout: 'base'
		end
	end

end
