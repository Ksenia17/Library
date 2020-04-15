class Admin::BookRequestsController < ApplicationController
before_action :authenticate_user! # for devise
load_and_authorize_resource :book_request
 
 layout "admin"

   def index
     @book_requests=BookRequest.all.order(complete_time: :desc) # показать необработанные запросы where("complete_time is null")

   end

   def negative
     @book_request = BookRequest.find(params[:id])
     #автоматическая проверка 
    # binding.pry
     begin
      @book_request.negat(current_user)
      redirect_to admin_book_requests_path, :notice => I18n.t('notice.refused') #'Refused, because there is not free book-item'
      rescue => @error
        redirect_to admin_book_requests_path, :notice => I18n.t('notice.refused') # 'Refused, because there is not free book-item'
     end 
   
   end

   def approval
    @book_request = BookRequest.find(params[:id])

   #автоматическая проверка - есть ли свободные экземпляры?
   begin
    @book_request.positive(current_user)
    redirect_to admin_book_requests_path, :notice => I18n.t('notice.processed') #'Book-request was successfully processed!'
  rescue =>   @error
    #  binding.pry
      redirect_to admin_book_requests_path, :notice => I18n.t('notice.refused') # 'Refused, because there is not free book-item'
   end 
      
     
   end

end
