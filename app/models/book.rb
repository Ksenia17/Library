class Book < ApplicationRecord
	validates :name  ,			presence: true 
    validates :book_type_id ,	presence: true
    validates :user_id  ,		presence: true
    validates :year_book,		presence: true      
end
