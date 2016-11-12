Rails.application.routes.draw do

  devise_for :users

  resources :users, :only => [:edit, :update, :show]
  
  resource :myposts
  
  resource :dashboards

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  
  resources :posts do

  	# user do
  	# 	get :dashboard
  	# end 

	collection do
		get :latest
	end

	resources :comments do

		collection do
			get :latest
		end

	end

  end

end
