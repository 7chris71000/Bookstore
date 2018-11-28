class Book < ApplicationRecord

	validates :title, :author, presence: true

	has_many :reviews

	# def reviews
	# 	Review.where(book_id: self.id)
	# end


end