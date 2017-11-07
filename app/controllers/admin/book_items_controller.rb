class Admin::BookItemsController < ApplicationController
 before_action :authenticate_user! # for devise
 load_and_authorize_resource :book_item
 
 layout "admin"
  

  def create
   
  
     @book = Book.find(params[:book_id])
     @book_item = @book.book_items.build  
    
     @book_item.user_id = current_user.id


     if @book_item.save 
      redirect_to admin_book_book_item_path(book_id: @book.id, id: @book_item.id),:notice => "New example was successfully created"  # update  # update
     end


  end

  def show
     @book_item = BookItem.find(params[:id]) #название модели
    
  end
  
  def index
    
    @book = Book.find(params[:book_id])
    @book_items =  @book.book_items.archived 
  
  end  


    def destroy #утилизировать, если не в наличии
   
    @book = Book.find(params[:book_id])
    @book_item = BookItem.find(params[:id])
  
    @book_item.destroyM  # не закончено
  
    redirect_to admin_book_book_items_path(@book)   
   
  end


end
