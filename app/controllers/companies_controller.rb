class CompaniesController < ApplicationController
  before_action :signed_in_user, only: [:index, :edit, :new, :update, :destroy]
  before_action :correct_user, only: :destroy
  before_action :set_company, only: [:show, :edit, :update, :destroy]

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
    if user_signed_in?
      redirect_to home_company_url
    end
  end

  def new
    @company = Company.new
  end

  def edit
  end

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

  def destroy
    @company.destroy
    respond_to do |format|
      format.html { redirect_to companies_url }
      format.json { head :no_content }
    end
  end

  private

    def company_params
      params.require(:company).permit(:name, :user_id)
    end

    def correct_user
      @company = current_user.companies.find_by(id: params[:id])
      redirect_to root_url if @company.nil?
    end

end
