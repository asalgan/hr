class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_filter :needs_subscription?
  include ApplicationHelper
  include SessionsHelper

  def ignore_controllers
    ["home", "sessions", "registrations", "passwords", "shared", "trials", "job_applications", "charges"]
  end

  def needs_subscription?
    if user_signed_in?
      return if ignore_controllers.include?(controller_name)
      if current_user.needs_subscription?
        redirect_to trial_expired_path
      end
    end
  end

  def current_company 
    @company ||= current_user.company
  end

  helper_method :current_company

end
