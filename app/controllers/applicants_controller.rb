class ApplicantsController < ApplicationController

	def index
		@job = Job.find(params[:job_id])
    @applicants = @job.applicants
    @current_position = Job.find_by(:id => params[:job_id])
	end

  def show
    @applicant = Applicant.find(params[:id])
    @job_applied_for = JobApplication.find_by(:applicant_id => params[:id])
    @job_applied_fora = JobApplication.find_by(:job_id => params[:id])
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

  private

    def applicant_params
      params.require(:applicant).permit(:first_name, :last_name, :birthdate, :address, :age, :current_job_role, :current_job_company, :current_job_city, :resume, :resume_parse)
    end

    def new_job_application
      job_application = JobApplication.new
      job_application.job_id = params[:job_id]
      job_application.company_id = params[:company_id]
      job_application.applicant_id = @applicant.id
      job_application.save
    end

    def resume_parser
      applicant = Applicant.last
        io = open('https://s3.amazonaws.com/HRAPP/applicants/resumes/000/000/046/original/Alan_Resume.pdf?')
        reader = PDF::Reader.new(io)
      reader.pages.each do |page|
        applicant.resume_parse = page.text.squish
      end
      applicant.save
    end

end