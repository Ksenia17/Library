class BooksController < ApplicationController
  before_filter :authenticate_user! # for devise
  load_and_authorise_resource # for cancancan


  def index
  end
end
