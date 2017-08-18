class BookHistory < ApplicationRecord
  belongs_to :book_request
  belongs_to :book_item
  belongs_to :user
  has_many   :fines
  
  attr_accesible :user, :user_id
  attr_accesible :book_item, :book_item_id  
  attr_accesible :book_request, :book_request_id

	validates  :request_id  ,	presence: true
	validates  :book_item_id  ,	presence: true
	validates  :user_id  ,		presence: true
	validates  :owned_from  ,	presence: true
end
