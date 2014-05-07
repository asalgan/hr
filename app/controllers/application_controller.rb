class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_filter :needs_subscription?
  include ApplicationHelper
  include SessionsHelper
  include CompaniesHelper

  def ignore_controllers
    ["sessions", "registrations", "passwords", "shared", "trials"]
  end

  def needs_subscription?
    return if ignore_controllers.include?(controller_name)
  	if current_user.needs_subscription?
  		redirect_to trial_expired_path
  	end
  end
end
