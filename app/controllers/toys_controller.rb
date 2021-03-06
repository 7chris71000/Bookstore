class ToysController < ApplicationController

	before_action :deny_access_for_non_signed_in_users

	def index
		@title = "Toys"
		@toys = Toy.all

		respond_to do |format|
			format.html
			format.json		
		end

	end

	def new
		@title = "New Toy"
		@toy = Toy.new
	end

	def create
		@toy = Toy.new(toy_params)
		if @toy.save
			redirect_to '/toys'
		else
			render 'new'
		end
	end

	def edit
		@title = "Edit Toy"
		@toy = Toy.find(params[:id])
	end 

	def update
		@toy = Toy.find(params[:id])
		if @toy.update(toy_params)
			redirect_to "/toys/#{@toy.id}"
		else
			render 'edit'
		end
	end
	
	def show
		
		@toy = Toy.find(params[:id])

		@title = "#{@toy.name}"

		respond_to do |format|
			format.html
			format.json
		end


		# random number list to populate 5 'related' toys under product
		# array is populated with 5 unique random numbers used to find id from DB
		@random_number_array = [] 
		i = 0 # counter to determine when 5 numbers have been added to array
		largest_id = Toy.last.id
		# while i < 5 do  
		# 	random_number = rand(1..largest_id)
		# 	if(!@random_number_array.include? random_number) # ensures that the number isnt in the array
		# 		@random_number_array[i] = random_number
		# 		i += 1;
		# 	end
		# end
	end

	def destroy
		@toy = Toy.find(params[:id])
		@toy.destroy
		redirect_to "/toys"
	end

	private

		def toy_params
			params.require(:toy).permit(:name, :manufacturer, :serial_number, :image_url)
		end

		def deny_access_for_non_signed_in_users
			if !user_signed_in?
				redirect_to root_path
			end
		end

end
