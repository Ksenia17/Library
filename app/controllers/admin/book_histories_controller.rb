class Admin::BookHistoriesController < ApplicationController
before_action :authenticate_user! # for devise
load_and_authorize_resource :book_request
 
 layout "admin"

 def create
   @book_request = BookRequest.find(params[:book_request_id])
   @book_history = @book_request.@book_histories.build
   
 end

end
