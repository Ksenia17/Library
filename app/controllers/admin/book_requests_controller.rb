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
     @book_request.negat(current_user)
 
     redirect_to admin_book_requests_path, :notice => 'Book-request was not successfully processed'
   
   end

   def approval
    @book_request = BookRequest.find(params[:id])

   #автоматическая проверка - есть ли свободные экземпляры?

    @book_request.positive(current_user)
    
    #if @book_request.save
      redirect_to admin_book_requests_path, :notice => 'Book-request was successfully processed!'
   # end
    
   
     
   end

end
