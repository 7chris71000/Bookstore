class Book < ApplicationRecord

	validates :title, presence: true

	has_many :reviews
	belongs_to :user, optional: true 

	# def reviews
	# 	Review.where(book_id: self.id)
	# end


end