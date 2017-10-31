class Admin::BookTypesController < ApplicationController
  before_action :authenticate_user! # for devise
  before_action :find_type, only: [:show,:edit,:update]
  load_and_authorize_resource :book_type

  layout "admin"

  def index
    @book_types=BookType.all
  end

  def new
  @book_type = BookType.new    
  end

  def create
    @book_type = BookType.new(booktype_params)
       
      if @book_type.save   
          if @book_type.errors.empty?   
            redirect_to admin_book_type_path(@book_type), :notice => "New category book was successfully created!"        
          end
          else
          @errors = @book_type.errors       
          render 'new' 
      end    
  end

  
  def show    
  end
  def edit    
  end

  def update   
    if  @book_type.update(booktype_params)
     redirect_to  admin_book_type_path(@book_type), :notice => 'Category book was successfully updated'
    end 
  end

  def destroy    
  end

private
   def find_type
      @book_type=BookType.find(params[:id])
   end
   def booktype_params
      params.require(:book_type).permit(:id,:name)
   end

end
