class PagesController < ApplicationController

	def home
		# @ is instance variable
		@a = [1,2,3,4,5]

		@logged_in = true;

	end

	def about

		@title = "About"

	end

	def contact		

		@title = "Contact"

	end	
	
	# this is all for the Bookstore
	def index 

		@title = "Dog Eared Books"

	end

	def category

		@title = "Dog Eared Books | Category"

	end

	def search

		@title = "Dog Eared Books | Search"

	end

	def searchRes

		@title = "Dog Eared Books | Result"

	end

	def cart

		@title = "Dog Eared Books | User's Cart"

	end

	def checkout

		@title = "Dog Eared Books | Checkout"

	end

	def product

		@title = "Dog Eared Books | PROD" #how do I make this dynamic

	end


end