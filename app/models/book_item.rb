class BookItem < ApplicationRecord
	belongs_to :book
  has_many   :book_histories
  belongs_to :user 
  
  validates  :book_id  , presence: true
	validates  :user_id  , presence: true

#  scope :activered, -> { where(book_id:  '8'  ) } 
  scope :archived, -> { where("archived_at is null" ) }

  def destroyM #обновление колонки archived_at
     
  self.archived_at = Time.now
  self.save
  end

end
