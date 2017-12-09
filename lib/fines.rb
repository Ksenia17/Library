class Fine

  def   perfom
    @users = User.all

    @books_history = @users.books_history
    
    @books_history.each do |history|
      if history.owned_to.to_date - history.owned_from.to_date > 7
        # проверка перед добавлением            

         if fines.any?{|i| i.book_history_id == history.id}
          # значит уже есть такой штрафник
         else
          # добавление в базу Fines
          @fine =  @books_history.fines.build # @user.fines.build
          #@fine.admin_user_id = 
          save
         end 
        
      else
        []  
      end  
    end 


  end


  handle_asynchronously :obrabotka

end