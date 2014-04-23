Hr::Application.routes.draw do

	root :to => "home#index"

  resources :companies do
  	member do
  		get :home, :positions, :pipeline
  	end
    resources :jobs do
    	resources :job_applications
    end
    resources :prospects
  end

  resources :applicants
  
  get "/companies/:company_id/jobs/:job_id/apply" => "job_applications#new", :as => :apply
  get "/companies/:company_id/jobs/:job_id/applicants" => "applicants#index", :as => :job_applicants

 
  devise_for :users, :controllers => {:registrations => "registrations"}

end