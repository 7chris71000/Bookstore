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
		toy = Toy.new(toy_params)
		toy.save
		puts "Toy Created"
		redirect_to '/toys'
	end

	def edit
		@title = "Edit Toy"
		@toy = Toy.find(params[:id])
	end 

	def update
		@toy = Toy.find(params[:id])
		@toy.update(toy_params)
		redirect_to "/toys/#{@toy.id}"
	end

	private

		def toy_params
			params.require(:toy).permit(:name, :manufacturer, :serial_number, :image_url)
		end

end
