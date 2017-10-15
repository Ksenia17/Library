class Book < ApplicationRecord
   belongs_to :user
   belongs_to :book_type
   has_many   :book_items
   validates_associated :book_items
   has_many   :book_requests
   validates_associated :book_requests

   validates :name  ,        presence: true 
   validates :book_type_id , presence: true
   validates :author  ,      presence: true
   validates :year_book,     presence: true  
   
   scope :readered, -> { where(user_id:  '4'  ) }  # '4' # current_user.id  
                          
#   attr_accesible :user, :user_id
#   attr_accesible :book_type, :book_type_id
end
