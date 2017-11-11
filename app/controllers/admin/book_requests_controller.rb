class Admin::BookRequestsController < ApplicationController
before_action :authenticate_user! # for devise
load_and_authorize_resource :book_request
 
 layout "admin"

   def index
     @book_requests=BookRequest.all # показать необработанные запросы

   end

   def negative
     @book_request = BookRequest.find(params[:id])
     #автоматическая проверка 
     @book_request.negat
     
    #if @book_request.save
     redirect_to admin_book_requests_path, :notice => 'Book-request was not successfully processed'
   #end
   end

   def approval
    @book_request = BookRequest.find(params[:id])

   # @book_history = @book_request.book_histories.build
   # @book_history.user_id = current_user.id
   # @book_history.owned_from = Time.now

    #автоматическая проверка - есть ли свободные экземпляры?

    @book_request.positive
    binding.pry
    #if @book_request.save
      redirect_to admin_book_requests_path
   # end
    
   # if @book_history.save
   #   redirect_to admin_book_requests_path, :notice => 'Book-request was successfully processed'
   # end
     
   end

end
