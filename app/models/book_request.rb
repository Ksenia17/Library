class BookRequest < ApplicationRecord
	belongs_to :book
  has_one    :book_history
  belongs_to :user

  validates  :book_id  , presence: true
	validates  :user_id  , presence: true	
    

  def negat(current_user)
    self.complete_time = Time.now 
    self.approved_flg = false
    self.admin_user_id = current_user.id
    self.save
  end  

  def positive(current_user)
    self.complete_time = Time.now  
    self.approved_flg = true
    self.admin_user_id = current_user.id
    self.save   

    self.give_to_user(user)   
  end   

  def give_to_user(user1)
   # binding.pry
   book_history = self.create_book_history #({:book_history_book_item_id => self.book_id,:book_history_user_id => user1.id,:book_history_owned_from => Time.now })   
   book_history.request_id = self.id
   book_history.book_item_id = self.book_id #?
   book_history.user_id = user1.id
   book_history.owned_from = Time.now 
   save # book_history.save - не работает )
  end    


end
