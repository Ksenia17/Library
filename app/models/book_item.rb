class BookItem < ApplicationRecord
	belongs_to :book
  has_many   :book_histories
  belongs_to :user 

  attr_accesible :book, :book_id
  attr_accesible :user, :user_id
  
  validates  :book_id  , presence: true
	validates  :user_id  , presence: true
end
