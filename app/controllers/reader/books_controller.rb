class Reader::BooksController < ApplicationController
  before_action :authenticate_user! # for devise
  load_and_authorize_resource :book, :book_request #:books,:parent => false     # for cancancan  не вышло!

  layout "reader"



   def index

       @books = Book.all  # все книги
     end
   

    def mybook        
      
      @books = Book.selected
      
     end 
 

end
