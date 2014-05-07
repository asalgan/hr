class JobsController < ApplicationController
  before_action :set_job, only: [:show, :edit, :update, :destroy]
  before_filter :trial_expired?

  def index
    @jobs = Job.all
    @current_positions = Job.all.where(:company_id => current_user.company.id)
    @openings = current_user.company.jobs
  end

  def show
    @current_job = Job.find(params[:id])
    @applicants = JobApplication.where(:job_id => params[:id])
  end

  def new
    @job = Job.new
    @company = current_user.company
    @employment_type_array = Job.employment_types
    @experience_level_array = Job.experience_level
  end

  def edit
  end

  def create
    @job = Job.new(job_params)

    respond_to do |format|
      if @job.save
        format.html { redirect_to company_jobs_url(:company_id => current_user.company.id), notice: 'Job was successfully created.' }
        format.json { render action: 'show', status: :created, location: @job }
      else
        format.html { render action: 'new' }
        format.json { render json: @job.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @job.update(job_params)
        format.html { redirect_to company_job_url, notice: 'Job was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @job.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @job.destroy
    respond_to do |format|
      format.html { redirect_to company_jobs_url }
      format.json { head :no_content }
    end
  end

  def make_inactive
    @job = Job.find(params[:job_id])
    @job.update_attributes(live_status: false)
    redirect_to company_jobs_path(params[:company_id])
  end

  def make_active
    @job = Job.find(params[:job_id])
    @job.update_attributes(live_status: true)
    redirect_to company_jobs_path(params[:company_id])
  end

  private

    def set_job
      @job = Job.find(params[:id])
    end

    def job_params
      params.require(:job).permit(:title, :description, :job_code, :company_id, :employment_type, :experience_level, :department, :location)
    end
end
