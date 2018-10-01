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

	# used for form on users page
	get "/create_user" => "users#create_user"

	get "/toys" => "toys#index"

end
