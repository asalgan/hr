Hr::Application.routes.draw do

	root :to => "home#index"

  resources :companies do
  	member do
  		get :home, :positions, :prospects, :pipeline
  	end
    resources :jobs do
    	resources :job_applications
    end
  end

  resources :applicants
  
  get "/companies/:company_id/jobs/:job_id/apply" => "job_applications#new", :as => :apply
 
  devise_for :users, :controllers => {:registrations => "registrations"}

end