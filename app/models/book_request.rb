class BookRequest < ApplicationRecord
	belongs_to :book
  has_one    :book_history
  belongs_to :user

  validates  :book_id  , presence: true
	validates  :user_id  , presence: true	

  scope :readered, -> (user_id) {where(user_id: current_user.id)}    

  def negat
   # binding.pry
  approved_flg = false
  admin_user_id = book.user_id.to_i
  save
  end  

  def positive
  complete_time = Time.now  
  approved_flg = true
  admin_user_id = book.user_id.to_i
  save      
  end       


end
