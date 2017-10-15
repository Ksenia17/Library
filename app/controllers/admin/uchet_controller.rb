class Admin::UchetController < ApplicationController
 before_action :authenticate_user! # for devise
 load_and_authorize_resource :book
 before_action :find_book,only: [:show,:edit,:update,:destroy]

 layout "admin"

  def index
    @books = Book.all
  end

  def new
  @book = Book.new  
  end

  def create
    @book = Book.new(book_params)
  #  @book.book_type_id = 
    @book.user_id = current_user.id

    if @book.save
       if @user.errors.empty?
        redirect_to admin_uchet_path(@book), :notice => "New book was successfully created!"        
       else
        render 'new' 
       end 
      
    end

  end

  def show   
  end

  def edit    
  end

  def update   
   if  @book.update(book_params)
        if @book.errors.empty?
          redirect_to edit_admin_uchet_path(@user), :notice => "Book was successfully updated"       
        end
     else
       render 'edit'
    end 
  end

  def destroy    
  end

private 
  def find_book
     @book = Book.find(params[:id])    
  end

  def book_params
    params.require(:book).permit(:name,:author,:year_book,:book_type_id)
  end


end
