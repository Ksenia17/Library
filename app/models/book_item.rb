class BookItem < ApplicationRecord
	belongs_to :book
  has_many   :book_histories
  belongs_to :user 

#  attr_accesible :book, :book_id
#  attr_accesible :user, :user_id
  
  validates  :book_id  , presence: true
	validates  :user_id  , presence: true

#  scope :activered, -> { where(book_id:  '8'  ) } 
  scope :archived, -> { where("archived_at is null" ) }

  def destroyM #обновление колонки archived_at

  # @book_item.archived_at = Time.now
  # @book_item.save

  end

end
