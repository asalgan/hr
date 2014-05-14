class ApplicantsController < ApplicationController
  before_filter :authenticate_user!

	def index
		@job = Job.find(params[:job_id])
    @applicants = @job.applicants
    @current_position = Job.find_by(:id => params[:job_id])
	end

  def show
    @applicant = Applicant.find(params[:id])
    @job_applied_for = JobApplication.find_by(:applicant_id => params[:id])
    @notes = Note.all.where(:applicant_id => params[:id])
  end

	def create
    @applicant = Applicant.new(applicant_params)

    respond_to do |format|
      if @applicant.save
        new_job_application
        if @applicant.resume.present?
          resume_parser
        else 
          nil
        end
        format.html { redirect_to root_path, notice: 'Thank you for applying' }
        format.json { render action: 'show', status: :created, location: @applicant }
      else
        format.html { render action: 'new' }
        format.json { render json: @applicant.errors, status: :unprocessable_entity }
      end
    end
  end

  def keep
    @applicant = JobApplication.find_by(:applicant_id => params[:applicant_id])
    @applicant.update_attributes(application_status: "In Review")
    redirect_to applicant_path(params[:applicant_id])
  end

  def accept
    @applicant = JobApplication.find_by(:applicant_id => params[:applicant_id])
    @applicant.update_attributes(application_status: "Accepted")
    redirect_to applicant_path(params[:applicant_id])
  end

  def reject
    @applicant = JobApplication.find_by(:applicant_id => params[:applicant_id])
    @applicant.update_attributes(application_status: "Rejected")
    redirect_to applicant_path(params[:applicant_id])
  end

  private

    def applicant_params
      params.require(:applicant).permit(:first_name, :last_name, :birthdate, :address, :age, :current_job_role, :current_job_company, :current_job_city, :resume, :resume_parse, :cover_letter, :phone_number, :email_address)
    end

    def new_job_application
      job_application = JobApplication.new
      job_application.job_id = params[:job_id]
      job_application.company_id = params[:company_id]
      job_application.application_status = "Application Received"
      job_application.applicant_id = @applicant.id
      job_application.save
    end

    def resume_parser
      applicant = Applicant.last
      io = open('https://dl.dropboxusercontent.com/u/97849947/Alan%20Resume.pdf')
      reader = PDF::Reader.new(io)
      reader.pages.each do |page|
        applicant.resume_parse = page.text.squish
      end
      applicant.save
    end

end