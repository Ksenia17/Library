class Book < ApplicationRecord
   belongs_to :user
   belongs_to :book_type
   has_many   :book_items
   has_many   :book_requests

   validates :name  ,        presence: true 
   validates :book_type_id , presence: true
   validates :user_id  ,     presence: true
   validates :year_book,     presence: true  

#   attr_accesible :user, :user_id
#   attr_accesible :book_type, :book_type_id
end
