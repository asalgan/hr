class ApplicantsController < ApplicationController


	def index
		@applications = Job_application.all.where(:job_id => params[:job_id])
    @current_position = Job.find_by(:id => params[:job_id])
	end

  def show
    @applicant = Applicant.find(params[:id])
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
      params.require(:applicant).permit(:first_name, :last_name, :birthdate, :address, :age, :current_job_role, :current_job_company, :current_job_city, :resume)
    end

    def new_job_application
      job_application = Job_application.new
      job_application.job_id = params[:job_id]
      job_application.company_id = params[:company_id]
      job_application.applicant_id = @applicant.id
      job_application.save
    end
end