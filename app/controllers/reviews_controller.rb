class ReviewsController < ApplicationController

	def index
		set_book
		@reviews = @book.reviews
	end

	def show
		
	end

	def new
		set_book
		@review = @book.reviews.build
	end

	def create
		set_book
		@review = @book.reviews.build(review_params)
		if @review.save
			redirect_to book_reviews_path(@book)
		else
			render 'new'
		end
	end

	def destroy

	end

	def update

	end

	def edit
	
	end

	private

		def set_book
			@book = Book.find(params[:book_id])
		end

		def review_params
			params.require(:review).permit(:author, :star_rating, :comment)
		end


end
