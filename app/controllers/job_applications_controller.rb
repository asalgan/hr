class JobApplicationsController < ApplicationController

	def index
		@disable_nav = true
		@job_application = Job.find(params[:job_id])
		@company = Company.find_by(:id => @job_application.company_id)
		@applicant = Applicant.new
	end

	def create
    @applicant = Applicant.new(applicant_params)

    respond_to do |format|
      if @applicant.save
        format.html { redirect_to company_job_job_applications_path, notice: 'Thank you for applying' }
        format.json { render action: 'show', status: :created, location: @job }
      else
        format.html { render action: 'new' }
        format.json { render json: @applicant.errors, status: :unprocessable_entity }
      end
    end
  end

  private

    def applicant_params
      params.require(:applicant).permit(:first_name, :last_name, :birthdate, :address, :age, :company_id, :job_id)
    end

end