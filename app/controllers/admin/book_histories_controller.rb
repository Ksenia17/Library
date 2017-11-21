class Admin::BookHistoriesController < ApplicationController
before_action :authenticate_user! # for devise
load_and_authorize_resource :book_request
 
 layout "admin"

 def create     
 end

end
