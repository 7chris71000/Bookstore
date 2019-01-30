class BooksController < ApplicationController

	include SessionsHelper

	before_action :set_book, only: [:show, :edit, :update, :destroy]
	before_action :deny_access_for_non_authors, only: [:edit, :update, :destroy]
	before_action :deny_access_for_non_admin, only: [:create, :new]


	# This runs before every method call. Checks if user is signed in
	# before_action :deny_access_for_non_signed_in_users

	def index
		@title = "Books"
		@books = Book.all

	end

	def new
		@title = "New Book"
		@book = Book.new
	end

	def create
		@book = Book.new(book_params)

		if @book.save
			redirect_to '/books'
		else
			render 'new'
		end
		
	end 

	def show
		@title = "Books Show"
	end

	def edit
		@title = "Edit Book"
	end

	def update

		if @book.update(book_params)
			redirect_to "/books/#{@book.id}"
		else
			render 'edit'
		end

	end

	def destroy

		@book.destroy
		redirect_to "/books"
	end


	private 

		def book_params
			#  whitelisting params(strong params)
			params.require(:book).permit(:title, :user_id, :published_year, :image_url)
		end

		def deny_access_for_non_signed_in_users
			if !user_signed_in?
				redirect_to root_path
			end
		end

		def set_book
			@book = Book.find(params[:id])
		end

		def deny_access_for_non_authors
			if(!user_signed_in? || (!current_user.admin && current_user.id != @book.user_id)) 
				redirect_to books_path
			end
		end

		def deny_access_for_non_admin
			if !admin?
				redirect_to books_path
			end
		end


	end