Hr::Application.routes.draw do

	root :to => "home#index"

  resources :companies do
  	member do
  		get :home, :positions, :prospects, :pipeline
  	end
    resources :jobs 
   
  end
 	match '/companies/%{id}/jobs/new', to: 'jobs#create', :as => :jobs, via: :post
 
  devise_for :users, :controllers => {:registrations => "registrations"}
  resources :users

end