class BooksController < ApplicationController

	def index

		@title = "Books"

		@books = Book.all

	end

	def new

		@title = "New Book"

	end

	def create

		title = params[:title]
		author = params[:author]
		published_year = params[:published_year]
		image_url = params[:image_url]
		

		book = Book.new(title: title, author: author, published_year: published_year, image_url: image_url)
		book.save
		puts "Book Created"

		redirect_to '/books'

	end


end