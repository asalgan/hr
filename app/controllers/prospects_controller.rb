class ProspectsController < ApplicationController
	before_action :signed_in_user
	# before_filter :correct_user

  def index
    @company = Company.find(params[:company_id])
    @applicants = params[:search].blank? ? @company.applicants : @company.applicants.search_by_applicant_info(params[:search])
  end

  private


end
