class Reader::BookRequestsController < ApplicationController
before_action :authenticate_user! # for devise
load_and_authorize_resource :book_request# for cancancan
  
  layout "reader"

  def index
  #  @book_requests=BookRequest.where(user_id: current_user.id)
    @book_requests = current_user.book_requests # через ассоциацию  здесь не показываем книги, которые уже поданы в заявке
  end

  
  def create 
   
    @book = Book.find(params[:book_id])

    # проверка - есть ли такая уже у читателя
     
    # binding.pry 
   
    @book_requests = current_user.book_requests

   # begin
     
   #  if @book_requests.owned.size != 0
       # puts 'такая книга уже есть на руках'
   #     redirect_to  reader_book_requests_path, :notice => 'Select book was on hands! Sorry...'
   #  else
         @book_request = @book.book_requests.build

         @book_request.user_id = current_user.id
    

        if @book_request.save
        # перейти на стр. "Журнал запросов" 
        redirect_to  reader_book_requests_path   
        end   

 #    end   
 #   rescue => @error
    
 #   end 
    
    
    
    

   



  end

end
