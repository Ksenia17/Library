class Reader::BooksController < ApplicationController
  before_action :authenticate_user! # for devise
  load_and_authorize_resource # for cancancan  не вышло!

  layout "reader"

  def index
    @books = Book.all
  end

  def edit
    @book = Book.find(params[:id])
  end


end
