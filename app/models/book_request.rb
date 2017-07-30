class BookRequest < ApplicationRecord
	validates :book_id  , presence: true
	validates :user_id  , presence: true	
end
