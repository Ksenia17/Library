class Admin::BookItemsController < ApplicationController
 before_action :authenticate_user! # for devise
 load_and_authorize_resource :book_item
 
 layout "admin"

  def new
    @book = Book.find(params[:book_id])
    @book_item =@book.book_items.build
    
  #  @book_item = Book_item.new
  end

  def create
   # @book_item = Book_item.new(item_params)
     @book = Book.find(params[:book_id])
     @book_item = @book.book_items.build(item_params)

     @book_item.created_at = Time.now
     @book_item.user_id = current_user.id


     if @book_item.save 
      redirect_to admin_book_book_item_path(@book_item)  # update
     end


  end

  def show
    @book_item = Book_item.find(params[:book_id])
  end
  
  def index
  #  @book_items = Book_item.activered # on book_id
  end  

  def update
    if @book_item.update 
      redirect_to admin_book_book_item_path(@book_item)  # update
     end
  end



  private
  def item_params
    params.require(:book_item).permit(:book_id)   
  end

end
