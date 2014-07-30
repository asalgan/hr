class JobApplicationsController < ApplicationController
  before_filter :authenticate_user!, only: [:index, :show, :edit, :update, :destroy]
    
  def index
    @disable_nav = true
  end
  
  def new
    @disable_nav = true
    @job_application = Job.find(params[:job_id])
    @company = Company.find_by(:id => @job_application.company_id)
    @applicant = Applicant.new
    @page_class = "application-page"
    render layout: 'base'
  end

  def create
    @disable_nav = true
    @job_application = JobApplication.new(job_application_params)
    @applicant = Applicant.new(applicant_params)

    # respond_to do |format|
    #   if @job_application.save && @applicant.save
    #     format.html { redirect_to company_job_job_applications_path, notice: 'Thank you for applying' }
    #     format.json { render action: 'show', status: :created, location: @job_application }
    #   else
    #     format.html { render action: 'new' }
    #     format.json { render json: @job_application.errors, status: :unprocessable_entity }
    #   end
    # end
  end


  private

    def job_application_params
      params.require(:applicant).permit(:company_id, :job_id)
    end

    def applicant_params
      params.require(:applicant).permit(:first_name, :last_name, :birthdate, :address, :age, :current_job_role, :current_job_company, :current_job_city, :resume, :resume_parse, :cover_letter, :phone_number, :email_address)
    end
end