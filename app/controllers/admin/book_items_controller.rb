class Admin::BookItemsController < ApplicationController
 before_action :authenticate_user! # for devise
 load_and_authorize_resource :book_item
 
 layout "admin"

  def new
    @book = Book.find(params[:book_id])
    @book_item =@book.book_items.build
    
  end

  def create
   
   binding.pry
     @book = Book.find(params[:book_id])
     @book_item = @book.book_items.build  #(item_params)
    
     @book_item.user_id = current_user.id


     if @book_item.save 
      redirect_to admin_book_book_item_path(@book,@book_item),:notice => "New example was successfully created"  # update  # update
     end


  end

  def show
    @book_item = BookItem.find(params[:book_id]) #название модели
  end
  
  def index
    @book = Book.find(params[:book_id])
    @book_items =  @book.book_items
  end  

  def update
    if @book_item.update 
      redirect_to admin_book_book_item_path(@book,@book_item)  # update
     end
  end



  private
  def item_params
   params.require(:book_item).permit(:book_id,:user_id,:archived_at)  # не получалось с одним параметром!
  
  end

end
