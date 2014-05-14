module SessionsHelper

  def store_location
    session[:return_to] = request.url if request.get?
  end

  def after_sign_in_path_for(resource)
    if current_company.present?
      company_path(:id => current_company.id)
    else
      new_company_path
    end
  end

end