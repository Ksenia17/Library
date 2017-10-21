class Admin::BookItemsController < ApplicationController
 before_action :authenticate_user! # for devise
 load_and_authorize_resource :book_item
 
 layout "admin"

  def new
    @book_item = Book_item.new
  end

  def create
    
  end

  def show
  end
  
  def index
  end  

end
