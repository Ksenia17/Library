class Reader::UsersController < ApplicationController  # AdminController
  before_action :authenticate_user! # for devise
#  load_and_authorize_resource # for cancancan

  layout "reader"
  

  def edit
    @user = User.find(params[:id])
  end

  def show
     @user = User.find(params[:id])
  end
  
  def update
    @user = User.find(params[:id])
  
  end 
  
   
       
end
