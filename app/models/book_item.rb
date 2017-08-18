class BookItem < ApplicationRecord
	belongs_to :book
  has_many   :book_history
  belongs_to :user 

  validates  :book_id  , presence: true
	validates  :user_id  , presence: true
end
