class Admin::BookTypesController < ApplicationController
  before_action :authenticate_user! # for devise
  before_action :find_type, only: [:show,:edit,:update,:destroy]
  load_and_authorize_resource :book_type

  layout "admin"

  def index
    # @book_types=BookType.all
    @book_types = BookType.order('name')
  end

  def new
 # binding.pry   
  @book_type = BookType.new    
  end

  def create
   # binding.pry  
    @book_type  = BookType.create(book_type_params)
    
      if @book_type.save   
          if @book_type.errors.empty?   #(id:@book_type.id)
            redirect_to admin_book_type_path(@book_type), :notice => "New category book was successfully created!"        
          end
          else
          @errors = @book_type.errors       
          render 'new' 
      end    
  end

  
  def show 
  # показать список книг этой категории через scope
  @books = Book.where(book_type_id: @book_type.id)  
  #binding.pry 
  end
  def edit    
  end

  def update   
    if  @book_type.update(book_type_params)
     redirect_to  admin_book_type_path(@book_type), :notice => 'Category book was successfully updated'
    end 
  end

  def destroy
 
  # запрос на проверку
  #@books = Book.where(book_type_id: @book_type.id)
  @books = @book_type.books # лучше через ассоциацию
  #binding.pry
  if not @books.empty?
    redirect_to admin_book_types_path, :notice => 'Category book was not deleted, because were books'
  else
    
    @book_type.destroy 
   
    redirect_to admin_book_types_path, :notice => 'Category book was successfully deleted'
  end  
  
              
end

private
   def find_type
      @book_type=BookType.find(params[:id])
   end
   def book_type_params
      # binding.pry  
      params.require(:book_type).permit(:name)   
      
      
   end

end
