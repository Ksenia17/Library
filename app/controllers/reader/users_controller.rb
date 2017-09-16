class Reader::UsersController < ApplicationController  # AdminController
  before_action :authenticate_user! # for devise
  load_and_authorize_resource # :users,:parent => false  # for cancancan - не вышло

  layout "reader"
  

  def edit
    @user = User.find(params[:id])
    authorize! :edit, @user
  end

  def show
     @user = User.find(params[:id])
     authorize! :show, @user
  end
  
  def update
    @user = User.find(params[:id])
    authorize! :update, @user
  end 
  
   
       
end
