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
		@book = Book.new(book_params)
		if @book.save
			redirect_to '/books'
		else
			render 'new'
		end
	end 

	def show
		@title = "Books Show"
		@book = Book.find(params[:id])

		# random number list to populate 5 'related' books under product
		# array is populated with 5 unique random numbers used to find id from DB
		@randomNumArray = [] 
		i = 0 # counter to determine when 5 numbers have been added to array
		largestId = Book.last.id
		# while i < 5 do  
		# 	randNum = rand(1..largestId)
		# 	if(!@randomNumArray.include? randNum) # ensures that the number isnt in the array
		# 		@randomNumArray[i] = randNum
		# 		i += 1;
		# 	end
		# end
	end

	def edit
		@title = "Edit Book"
		@book = Book.find(params[:id])
	end

	def update
		@book = Book.find(params[:id])
		if @book.update(book_params)
			redirect_to "/books/#{@book.id}"
		else
			render 'edit'
		end

	end

	def destroy
		@book = Book.find(params[:id])
		@book.destroy
		redirect_to "/books"
	end


	private 

		def book_params
			#  whitelisting params(strong params)
			params.require(:book).permit(:title, :author, :published_year, :image_url)
		end


end