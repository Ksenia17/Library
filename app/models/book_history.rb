class BookHistory < ApplicationRecord
	validates :request_id  ,	presence: true
	validates :book_item_id  ,	presence: true
	validates :user_id  ,		presence: true
	validates :owned_from  ,	presence: true
end
