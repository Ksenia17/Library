class Reader::BookHistoriesController < ApplicationController
before_action :authenticate_user! # for devise
load_and_authorize_resource :book_request# for cancancan
  
  layout "reader" 
  
  def index
    @books_history = current_user.book_histories.not_available  # where("owned_to is null")
  end

end
