module SessionsHelper

  def signed_in_user
    unless signed_in?
      store_location
      redirect_to new_user_session_path, notice: "Please sign in." 
    end
  end

  def store_location
    session[:return_to] = request.url if request.get?
  end

  def after_sign_in_path_for(resource)
    if current_user.company.present?
      company_path(:id => current_user.company.id)
    else
      new_company_path
    end
  end

end