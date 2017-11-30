class Reader::BookTypesController < ApplicationController
  before_action :authenticate_user! # for devise
  load_and_authorize_resource :book_type# for cancancan
  
  layout "reader"

  def index
    @book_types = Booktype.all
  end
end
