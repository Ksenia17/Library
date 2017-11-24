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
     
    active_items = self.book.book_items.noarchived
   # binding.pry
    if  !active_items.empty?  
      free_items = active_items.select{|item| item.book_histories.where('owned_to is null').empty?} # получили свободные экземпляры
    # free_items = active_items.select{|item| item.book_histories.not_available.empty?}
    else
      raise 'active items is null'
      free_items.map{0}
    end  
  # binding.pry
   if  (!free_items.empty?) || (!free_items.blank?) 
        av_book_item = free_items.first

        self.complete_time = Time.now  
        self.approved_flg = true
        self.admin_user_id = current_user.id
        self.save   
        
        self.give_to_user(user,av_book_item) # 

   else   
      raise  'no available book items'    # в случае - нет , выдать ошибку-что  нет свободных экземпляров      
   end 
  

     
  end   

  def give_to_user(user1,av_book_item1)
  
   book_history = self.build_book_history  # build - no work
   
   book_history.book_item = av_book_item1 
   book_history.user = user1 # ассоциация
   book_history.owned_from = Time.now 
   book_history.request_id = self.id 
   book_history.save # book_history.save - не работает )
 #  binding.pry #book_history.errors
  end    


end
