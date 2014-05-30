class HomeController < ApplicationController

	def index
		if user_signed_in?
			redirect_to current_company
		end
		render layout: 'base'
	end

end
