class ReviewsController < ApplicationController

	before_action :set_book
	before_action :set_review, only: [:show, :destroy, :update, :edit]

	def index
		@reviews = @book.reviews
	end

	def show
	end

	def new
		
		@review = @book.reviews.build
	end

	def create
		@review = @book.reviews.build(review_params)
		if @review.save
			redirect_to book_reviews_path(@book)
		else
			render 'new'
		end
	end

	def destroy
		@review.destroy
		redirect_to book_reviews_path(@book)
	end

	def update
		if @review.update(review_params)
			redirect_to book_reviews_path(@book)
		else 
			render 'edit'
		end
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

		def set_review
			@review = @book.reviews.find(params[:id])
		end



end
