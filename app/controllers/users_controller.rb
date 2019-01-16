class UsersController < ApplicationController

	before_action :deny_access_for_non_signed_in_users

	def index
		
		@users = User.all

		@title = "Users"

	end

	def show

		@user = User.find(params[:id])
	
		@title = @user.name

	end

	def edit
		@user = User.find(params[:id])

		if current_user != @user
			redirect_to new_user_session_path
		end

	end

	def new
		@user =User.new

		if !current_user.admin
			redirect_to root_path
		end

	end

	def create
		@user = User.new(user_params)
		if @user.save
			redirect_to users_path
		else
			render 'new'
		end
		
	end 

	def update
	end

	def destroy 
	end



	# def create

	# 	user_params = params.require(:user).permit(:name, :password, :age, :gender)

	# 	user = User.new(user_params)
	# 	user.save
	# 	puts "User Created"
		
	# 	redirect_to '/users'

	# end

	private

		def user_params
			params.require(:user).permit(:email, :name, :age, :password, :password_confirmation)
		
		end 

		def deny_access_for_non_signed_in_users
			if !user_signed_in?
				redirect_to new_user_session_path
			end
		end

end
