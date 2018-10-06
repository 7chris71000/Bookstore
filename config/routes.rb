Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "pages#home"

  get "/welcome" => "pages#home"

  get "/about" => "pages#about"

  get "/contact" => "pages#contact"
  
	# Books resource
	get "/books" => "books#index"

	# Users resource
	get "/users" => "users#index"

	#Creating new user page
	get "/users/new" => "users#new"

	# used for form on users page
	post "/users" => "users#create"

	get "/toys" => "toys#index"

end