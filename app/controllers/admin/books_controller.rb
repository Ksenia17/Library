class Admin::BooksController < ApplicationController
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
  #@book = current_user.books.create(book_params)
    
    @book = Book.new(book_params)
    @book.user_id = current_user.id
 #  @book.user = current_user # 

    
      if @book.save   

          if @book.errors.empty?   
            redirect_to admin_book_path(@book), :notice => "New book was successfully created!"        
          end
          else
          @errors = @book.errors       
          render 'new' 
      end 
   end
  

  def show   
  end

  def edit    
  end

  def update   
    #записать выбранный select
   if  @book.update(book_params)

        if @book.errors.empty?
          
          redirect_to admin_book_path(@book), :notice => "Book was successfully updated"       
        end  
        else
       @errors = @book.errors
       render 'edit'
       
    end   
  end

  def destroy    
    
     # будет проверка, book_item
    # если есть экземпляры?
   # binding.pry
    @book_items= @book.book_items
    if not @book_items.empty?
      redirect_to admin_books_path,:notice => "Book was not deleted, because were books-items"    
    else 
      @book.destroy
      redirect_to admin_books_path,:notice => "Book was successfully deleted"
    end
   
  end

private 
  def find_book
     @book = Book.find(params[:id])    
  end

  def book_params
    
    params.require(:book).permit(:name, :book_type_id, :author, :year_book)   

  end


end
