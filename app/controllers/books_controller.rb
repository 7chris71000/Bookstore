class BooksController < ApplicationController

	def index

		@title = "Books"
		@books = Book.all

	end

	def new
		@title = "New Book"
		@book = Book.new
	end

	def create
		#  whitelisting params(strong params)
		book = Book.new(book_params)
		book.save
		puts "Book Created"
		redirect_to '/books'
	end 

	def show
		@title = "Books Show"
		@book = Book.find(params[:id])
	end

	def edit
		@title = "Edit Book"
		@book = Book.find(params[:id])
	end

	def update
		@book = Book.find(params[:id])
		@book.update(book_params)
		redirect_to "/books/#{@book.id}"
	end

	private 

		def book_params
			params.require(:book).permit(:title, :author, :published_year, :image_url)
		end


end