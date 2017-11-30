class BookItem < ApplicationRecord
	belongs_to :book
  has_many   :book_histories
  belongs_to :user 
  
  validates  :book_id  , presence: true
	validates  :user_id  , presence: true


  scope :noarchived, -> { where("archived_at is null" ) }


  def  destroyM #
 # binding.pry  #self   
  self.archived_at = Time.now   # без self
  self.save

  end

end
