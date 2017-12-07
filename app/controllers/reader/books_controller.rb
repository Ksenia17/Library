class Reader::BooksController < ApplicationController
  before_action :authenticate_user! # for devise
  load_and_authorize_resource :book #:books,:parent => false     # for cancancan  не вышло!

  layout "reader"



   def index
    #  binding.pry
       @books = Book.all #not_state #all  # все книги и не показыаю книги, которые сейчас в заявке

     end
   

  #  def mybook        
    
  #    @books = current_user.book_histories.where("owned_to is null")
      
  #   end 
 

end
