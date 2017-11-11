class Reader::BookRequestsController < ApplicationController
before_action :authenticate_user! # for devise
load_and_authorize_resource :book_request# for cancancan
  
  layout "reader"

  def index
    @book_requests=BookRequest.where(user_id: current_user.id)
  end

  
  def create 
    #binding.pry
    @book = Book.find(params[:book_id])
    @book_request = @book.book_requests.build

    @book_request.user_id = current_user.id
    

    if @book_request.save
    # перейти на стр. "Журнал запросов" 
    redirect_to  reader_book_requests_path   
    end   
  end

end
