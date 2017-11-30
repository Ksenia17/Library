class Reader::BookRequestsController < ApplicationController
before_action :authenticate_user! # for devise
load_and_authorize_resource :book_request# for cancancan
  
  layout "reader"

  def index
  #  @book_requests=BookRequest.where(user_id: current_user.id)
    @book_requests = current_user.book_requests # через ассоциацию
  end

  
  def create 
    #binding.pry
    @book = Book.find(params[:book_id])

    # проверка - есть ли такая уже у читателя
    # scope on user_id - @book_request.user_sele
    # scope on book_id  - @book_request.book_hand
    binding.pry
    @book_request = @book.book_requests.user_sele(current_user)   
    if @book_request.size != nil 
      puts 'такая книга уже есть в наличии'
    else puts 'в наличии  - нет'  
    end
    
    

    @book_request = @book.book_requests.build

    @book_request.user_id = current_user.id
    

    if @book_request.save
    # перейти на стр. "Журнал запросов" 
    redirect_to  reader_book_requests_path   
    end   
  end

end
