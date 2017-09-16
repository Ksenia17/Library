class Reader::BooksController < ApplicationController
  before_action :authenticate_user! # for devise
  load_and_authorize_resource #:books,:parent => false     # for cancancan  не вышло!

  layout "reader"

  def index
    @books = Book.all 
    authorize! :index, @books
  end

  def edit
    @book = Book.find(params[:id])
    authorize! :edit, @books
  end


end
