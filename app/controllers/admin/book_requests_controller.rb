class Admin::BookRequestsController < ApplicationController
before_action :authenticate_user! # for devise
load_and_authorize_resource :book_request
 
 layout "admin"

   def index
     @book_requests=BookRequest.all
   end

end
