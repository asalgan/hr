class CompaniesController < ApplicationController
  before_action :signed_in_user, only: [:index, :edit, :new, :update, :destroy]
  before_action :correct_user, only: :destroy
  before_action :set_company, only: [:show, :edit, :update, :destroy]

  # GET /companies
  # GET /companies.json
  def index
    @companies = Company.all
  end

  def home
  end

  def positions
    @new_position = Job.new(params.permit(:description, :code, :company_id))
    @company = Company.find(params[:id])

    # render :partial => 'openings', :content_type => 'text/html'

  end

  def prospects
    @applicants = Applicant.where(:company_id => current_user.company.id)
  end

  def pipeline
  end

  # GET /companies/1
  # GET /companies/1.json
  def show
    if user_signed_in?
      redirect_to home_company_url
    end
  end

  # GET /companies/new
  def new
    @company = Company.new
  end

  # GET /companies/1/edit
  def edit
  end

  # POST /companies
  # POST /companies.json
  def create
    @company = Company.new(company_params)

    respond_to do |format|
      if @company.save
        format.html { redirect_to @company, notice: 'Company was successfully created.' }
        format.json { render action: 'show', status: :created, location: @company }
      else
        format.html { render action: 'new' }
        format.json { render json: @company.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /companies/1
  # PATCH/PUT /companies/1.json
  def update
    respond_to do |format|
      if @company.update(company_params)
        format.html { redirect_to @company, notice: 'Company was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @company.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /companies/1
  # DELETE /companies/1.json
  def destroy
    @company.destroy
    respond_to do |format|
      format.html { redirect_to companies_url }
      format.json { head :no_content }
    end
  end

  private

    # Never trust parameters from the scary internet, only allow the white list through.
    def company_params
      params.require(:company).permit(:name, :user_id)
    end

    def correct_user
      @company = current_user.companies.find_by(id: params[:id])
      redirect_to root_url if @company.nil?
    end

end
