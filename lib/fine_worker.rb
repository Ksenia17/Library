class FineWorker

    
  def   perfom
   
    fines = Fine.all

    books_history = BookHistory.all
    
    books_history.each do |history|
  
      if  Time.now.to_date - history.owned_from.to_date > 7
        # проверка перед добавлением            
  
        fines = Fine.all
         if fines.any?{|i| i.book_history_id == history.id}
          # значит уже есть такой штрафник
         else
          # добавление в базу Fines
           fine = history.fines.build      
           fine.user_id =  history.user_id      
             
           fine.save

         end 
            
      end  
    end 


  end
 

end