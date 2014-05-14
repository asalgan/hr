class ProspectsController < ApplicationController
	before_filter :authenticate_user!

  def index
    @company = current_company
    @applicants = params[:search].blank? ? @company.applicants : @company.applicants.search_by_applicant_info(params[:search])
  end

  private


end
