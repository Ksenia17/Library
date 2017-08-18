class BookHistory < ApplicationRecord
  belongs_to :book_request
  belongs_to :book_item
  belongs_to :user
  has_many   :fine
  
	validates  :request_id  ,	presence: true
	validates  :book_item_id  ,	presence: true
	validates  :user_id  ,		presence: true
	validates  :owned_from  ,	presence: true
end
