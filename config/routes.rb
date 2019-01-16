Rails.application.routes.draw do

  resources :users
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "pages#home"

  get "/welcome" => "pages#home"

  get "/about" => "pages#about"

  get "/contact" => "pages#contact"
  
	# # Books resource

	resources :books do 
		resources :reviews
	end



	# get "/books" => "books#index"
	# # Creating new book page
	# get "/books/new" => "books#new"

	# get "/books/:id" => "books#show", as: :book 

	# get "/books/:id/edit" => "books#edit"

	# patch "/books/:id" => "books#update"

	# # Used for form on users page
	# post "/books" => "books#create"

	# delete "/books/:id" => "books#destroy"
	
	# Users resource: do not need since devise_for :users covers all views
	#resources :users, only: [:index, :new, :create] 

	resources :toys

  resources :blog_posts



end