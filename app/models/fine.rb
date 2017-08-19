class Fine < ApplicationRecord
	belongs_to :user
  belongs_to :book_history
  
  validates  :user_id  ,		presence: true
	validates  :book_history_id, presence: true

#  attr_accessible :user, :user_id

end
