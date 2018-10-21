class ToysController < ApplicationController

	def index

		@toys = Toy.all;

	end

	def new
	
		@title = "New Toy"

	end

	def create

		toyName = params[:name]
		manufacturer = params[:manufacturer]
		serial_number = params[:serial_number]
		image_url = params[:image_url]

		toy = Toy.new(name: toyName, manufacturer: manufacturer, serial_number: serial_number, image_url: image_url)
		toy.save
		
		puts "Toy Created"
		

		redirect_to '/toys'

	end


end
