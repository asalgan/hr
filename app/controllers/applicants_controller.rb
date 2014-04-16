class ApplicantsController < ApplicationController

	def index
		@applicants = Applicant.all
	end

	def create
    @applicant = Applicant.new(applicant_params)

    respond_to do |format|
      if @applicant.save
        new_job_application
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
      params.require(:applicant).permit(:first_name, :last_name, :birthdate, :address, :age, :company_id, :job_id)
    end

    def new_job_application
      job_application = Job_application.new
      job_application.job_id = params[:job_id]
      job_application.applicant_id = @applicant.id
      job_application.save
    end
end