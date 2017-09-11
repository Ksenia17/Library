class Admin::UsersController < ApplicationController  # AdminController
 before_action :authenticate_user! # for devise
 #load_and_authorise_resource # for cancancan


  layout "admin"

  def show
    @user = User.find(params[:id])
  end

  def index
  
    @users = User.confirmed

  end    
   

  def list_wait
    @users = User.registed 
  end  

  def list_fines
    @users = User.penalized
  end
    
       
end
