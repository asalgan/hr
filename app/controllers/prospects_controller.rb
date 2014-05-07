class ProspectsController < ApplicationController

  def index
    @company = Company.find(params[:company_id])
    @applicants = params[:search].blank? ? @company.applicants : @company.applicants.search_by_applicant_info(params[:search])
  end

end
