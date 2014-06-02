class HomeController < ApplicationController
	
	def index
		if user_signed_in?
			redirect_to current_company
		else
			@page_class = "home"
			render layout: 'base'
		end
	end

end
