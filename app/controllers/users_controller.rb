class UsersController < ApplicationController

	def index
		
		@users = User.all

	end

	def create_user

		username = params[:user]
		password = params[:pass]
		matches = (params[:pass] == params[:confirmpass])

		if(matches && username != nil && password != nil)
			user = User.new
			user.name = username
			user.password = password
			user.save
			puts "User Created"
		end 

		redirect_to '/users'

	end

end