class Book < ApplicationRecord
   belongs_to :user
   has_one    :book_type
   has_many   :book_item
   has_many   :book_request

   validates :name  ,        presence: true 
   validates :book_type_id , presence: true
   validates :user_id  ,     presence: true
   validates :year_book,     presence: true  

end
