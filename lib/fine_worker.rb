class FineWorker

 include Delayed::RecurringJob
  run_every 1.day
  run_at '11:00am'
  timezone 'Europe/Kiev'
  queue 'slow-jobs'

   
  def   perfom
   
    fines = Fine.all

    books_history = BookHistory.on_hands
    
    books_history.each do |history|
  
      if  Time.now.to_date - history.owned_from.to_date > 7
        # проверка перед добавлением            
  
      #  fines = Fine.all
        if history.fines.empty?
          fine = history.fines.build      
          fine.user_id =  history.user_id      
          fine.save     
        end 
         
      end  
    end 


  end
 

end