class BookRequest < ApplicationRecord
	belongs_to :book
  has_one    :book_history
  belongs_to :user
  
  validates  :book_id  , presence: true
	validates  :user_id  , presence: true	
end
