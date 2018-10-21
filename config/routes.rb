Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "pages#home"

  get "/welcome" => "pages#home"

  get "/about" => "pages#about"

  get "/contact" => "pages#contact"
  
	# Books resource
	get "/books" => "books#index"
	# Creating new book page
	get "/books/new" => "books#new"
	# Used for form on users page
	post "/books" => "books#create"

	# Users resource
	get "/users" => "users#index"
	# Creating new user page
	get "/users/new" => "users#new"
	# Used for form on users page
	post "/users" => "users#create"

	get "/toys" => "toys#index"

end