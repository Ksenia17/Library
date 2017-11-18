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
    #проверка - есть ли свободный экз?
    #массив - все экз.книги
    masVse = self.book.book_items
  #  binding.pry
    #масссив - на руках
  #  masLand = self.book.book_items.book_histories  # nil
    
    if self.book_history == nil
    av_book_item = self.book.book_items.sample[:id]
    end  


    self.complete_time = Time.now  
    self.approved_flg = true
    self.admin_user_id = current_user.id
    self.save   
    binding.pry
    self.give_to_user(user,av_book_item)   
  end   

  def give_to_user(user1,av_book_item1)
  
   book_history = self.create_book_history  # build - no work
   binding.pry
   book_history.book_item_id = av_book_item1 
   book_history.user_id = user1.id
   book_history.owned_from = Time.now 
   save # book_history.save - не работает )
  end    


end
