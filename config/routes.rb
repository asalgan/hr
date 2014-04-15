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
  
  match '/companies/%{id}/jobs/new', to: 'jobs#create', :as => :jobs, via: :post
 	match '/companies/%{id}/jobs/%{id}/job_applications', to: 'job_applications#create', :as => :applicants, via: :post
 
  devise_for :users, :controllers => {:registrations => "registrations"}

end