class Reader::BooksController < ApplicationController
  before_action :authenticate_user! # for devise
  load_and_authorize_resource :book, :book_request #:books,:parent => false     # for cancancan  не вышло!

  layout "reader"



   def index

       @books = Book.all  # все книги
     end

   def takebook
  #  binding.pry
    @book = Book.find(params[:book_id])
    @book_request = @book.book_requests.build

    @book_request.user_id = current_user.id
    @book_request.book_id = @book.id

    if @book_request.save
    # перейти на стр. "Журнал запросов" 
    redirect_to  reader_book_requests_path     #admin_book_book_item_path(book_id: @book.id, id: @book_item.id),:notice => "This book was successfully selected"
    end
   end

    def mybook        
      
      @books = Book.selected
      
     end 
 

end
