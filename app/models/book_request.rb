class BookRequest < ApplicationRecord
	belongs_to :book
  has_one    :book_history
  belongs_to :user

  validates  :book_id  , presence: true
	validates  :user_id  , presence: true	

  scope :readered, -> (user_id) {where(user_id: current_user.id)}             
end
