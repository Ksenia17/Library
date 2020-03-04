class Book < ApplicationRecord
   belongs_to :user
   belongs_to :book_type
   has_many   :book_items
   
   has_many   :book_requests
   
   mount_uploader :image, ImageUploader
   validates :name,        presence: true 
   validates :book_type_id, presence: true
   validates :author,      presence: true
   validates :year_book,     presence: true  
                  
  scope :not_state, ->  { joins(:book_requests).where("complete_time is not null ").group("id")} 
  
end
