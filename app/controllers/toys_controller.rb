class ToysController < ApplicationController

	def index

		@title = "Toys"
		@toys = Toy.all;

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


end
