module CompaniesHelper

	def set_company
    @company = Company.find(params[:id])
	end
	
end
