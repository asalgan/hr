class HomeController < ApplicationController
	skip_before_filter :needs_subscription?

	def index
		if user_signed_in?
			redirect_to current_user.company
		end
	end

end
