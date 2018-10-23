class BooksController < ApplicationController

	def index

		@books = Book.all

	end

	def product

		bookId = params[:id]
		@book = Book.find(bookId)

		@title = @book.title

		# random number list to populate 5 'related' books under product
		# array is populated with 5 unique random numbers used to find id from DB
		@randomNumArray = [] 
		i = 0 # counter to determine when 5 numbers have been added to array
		largestId = Book.last.id
		while i < 5 do  
			randNum = rand(1..largestId)
			if(!@randomNumArray.include? randNum) # ensures that the number isnt in the array
				@randomNumArray[i] = randNum
				i += 1;
			end
		end


	end


end