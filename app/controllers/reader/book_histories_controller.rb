class Reader::BookHistoriesController < ApplicationController
before_action :authenticate_user! # for devise
load_and_authorize_resource :book_history# for cancancan
  
  layout "reader" 
  
  def index
    @books_history = current_user.book_histories.all  #on_hands
  end

  def return_book
  # binding.pry   
   @books_history = BookHistory.find(params[:id]) 

   @books_history.book_return
   
   redirect_to reader_book_histories_path
      
  end

end