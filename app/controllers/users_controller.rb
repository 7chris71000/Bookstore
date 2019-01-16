class UsersController < ApplicationController

	before_action :deny_access_for_non_signed_in_users

	# def index
		
	# 	@user = User.new
	# 	@users = User.all

	# 	@title = "Users"

	# end

	def show
	
		@title = User.find(params[:id]).name

		@profile = User.find(params[:id])


	end


	# def create

	# 	user_params = params.require(:user).permit(:name, :password, :age, :gender)

	# 	user = User.new(user_params)
	# 	user.save
	# 	puts "User Created"
		
	# 	redirect_to '/users'

	# end

	private

		def deny_access_for_non_signed_in_users
			if !user_signed_in?
				redirect_to new_user_session_path
			end
		end

end
