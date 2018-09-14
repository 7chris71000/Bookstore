class PagesController < ApplicationController

	def home
		# @ is instance variable
		@a = [1,2,3,4,5]

		@logged_in = true;

	end

	def about

		@title = "About"

	end

	def contact		

		@title = "Contact"

	end	
	

end
# statc java on class level
# activerecord
# create another migration like book (Product). carefull on naming plural vs singular
# check into git add caseyli
# 
