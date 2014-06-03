class CompaniesController < ApplicationController
  before_filter :authenticate_user!

  def index
    @companies = Company.all
  end

  def home
  end

  def positions
    @new_position = Job.new(params.permit(:description, :code, :company_id))
    @company = Company.find(params[:id])
  end

  def pipeline
  end

  def show
    redirect_to company_jobs_url(current_company.id)
  end

  def new
    @disable_nav = true
    @company = Company.new
    @page_class = "company-page"
    render layout: 'base'
  end

  def edit
  end

  def create
    @company = Company.new(company_params)

    respond_to do |format|
      if @company.save
        format.html { redirect_to @company }
        format.json { render action: 'show', status: :created, location: @company }
      else
        format.html { render action: 'new' }
        format.json { render json: @company.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @company = current_company

    respond_to do |format|
      if @company.update(company_params)
        format.html { redirect_to @company }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @company.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @company.destroy
    respond_to do |format|
      format.html { redirect_to companies_url }
      format.json { head :no_content }
    end
  end

  private

    def company_params
      params.require(:company).permit(:name, :user_id, :logo)
    end

end
