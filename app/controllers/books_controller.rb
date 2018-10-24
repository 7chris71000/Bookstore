class BooksController < ApplicationController

	def index

		@title = "Books"

		@books = Book.all

	end

	def new

		@title = "New Book"

		@book = Book.new
		@book.title = "Default Title"

	end

	def create
		#  whitelisting params(strong params)
		book_params = params.require(:book).permit(:title, :author, :published_year, :image_url)

		book = Book.new(book_params)
		book.save
		puts "Book Created"

		redirect_to '/books'

	end 


end