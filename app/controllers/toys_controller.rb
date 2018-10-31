class ToysController < ApplicationController

	def index
		@title = "Toys"
		@toys = Toy.all
	end

	def new
		@title = "New Toy"
		@toy = Toy.new
	end

	def create
		toy_params = params.require(:toy).permit(:name, :manufacturer, :serial_number, :image_url)
		toy = Toy.new(toy_params)
		toy.save
		puts "Toy Created"
		redirect_to '/toys'
	end

	def show
		@title = "Edit Toy"
		@toy = Toy.find(params[:id])

		# random number list to populate 5 'related' toys under product
		# array is populated with 5 unique random numbers used to find id from DB
		@randomNumArray = [] 
		i = 0 # counter to determine when 5 numbers have been added to array
		largestId = Toy.last.id
		while i < 5 do  
			randNum = rand(1..largestId)
			if(!@randomNumArray.include? randNum) # ensures that the number isnt in the array
				@randomNumArray[i] = randNum
				i += 1;
			end
		end
	end



end
