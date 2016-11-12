Rails.application.routes.draw do
  resources :people
	 get "welcome/say_hello" => "welcome#say"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  	get "welcome" => "welcome#index"

  	root :to => "welcome#index"

end

