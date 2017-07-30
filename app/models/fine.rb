class Fine < ApplicationRecord
	validates :user_id  ,		presence: true
	validates :book_history_id, presence: true

end
