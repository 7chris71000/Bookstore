class Toy < ApplicationRecord

	validates :name, presence: true
	validates_length_of :serial_number, minimum: 1, maximum: 20, allow_blank: false

end