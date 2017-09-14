class Reader::BooksController < ApplicationController
  before_action :authenticate_user! # for devise

  layout "reader"

  def index
    @books = Book.all
  end
end
