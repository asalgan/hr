Hr::Application.routes.draw do

  resources :notes

	root :to => "home#index"

  resources :companies do
  	member do
  		get :home, :positions, :pipeline
  	end
    resources :jobs do
    	resources :job_applications
      get :make_inactive
      put :make_inactive      
      get :make_active
      put :make_active
    end
    resources :prospects
  end

  resources :applicants do
    get :keep
    put :keep      
    get :accept
    put :accept
    get :reject
    put :reject
  end
  
  get "/companies/:company_id/jobs/:job_id/apply" => "job_applications#new", :as => :apply
  get "/companies/:company_id/jobs/:job_id/applicants" => "applicants#index", :as => :job_applicants
  # post ""

  devise_for :users, :controllers => {:registrations => "registrations"}



end