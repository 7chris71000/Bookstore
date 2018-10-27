class UsersController < ApplicationController

	def index
		
		@user = User.new
		@users = User.all

		@title = "Users"

	end

	# def new
	
	# 	@title = "New User"

	# end


	def create

		user_params = params.require(:user).permit(:name, :password, :age, :gender)

		user = User.new(user_params)
		user.save
		puts "User Created"
		
		redirect_to '/users'

	end

end
