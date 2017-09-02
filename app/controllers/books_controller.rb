class BooksController < ApplicationController
  before_action :authenticate_user! # for devise
#  load_and_authorise_resource # for cancancan

  def index
  end

  def create    
  end

end
