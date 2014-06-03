class HomeController < ApplicationController
	
	def index
		if user_signed_in?
			redirect_to company_jobs_url(current_company.id)
		else
			@page_class = "home"
			render layout: 'base'
		end
	end

end
