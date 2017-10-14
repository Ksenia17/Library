class Admin::UchetController < ApplicationController
 before_action :authenticate_user! # for devise
 load_and_authorize_resource :book

 layout "admin"

  def index
    @books = Book.all
  end

  def show
  end

  def edit
    
  end

  def update
    
  end

  def destroy
    
  end



end
