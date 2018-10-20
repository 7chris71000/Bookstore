class BooksController < ApplicationController

	def index

		@books = Book.all

	end

	def product

		@title = "Product" #this will be dynamic eventually

	end


end