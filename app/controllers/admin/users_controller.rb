class Admin::UsersController < ApplicationController  # AdminController
  

  layout "admin"

  def show
    @user = User.find(params[:id])
  end

  def index
  #  @users = User.all
  #  @users = User.order("first_name")
  #  binding.pry

  # if params[:confirmation_time]  # confirmation_by_admin_id
    
  #  @users = User.where(["confirmation_time != ?", nil]).order("first_name") 

   #  @users = User.where(:confirmation_by_admin_id => (params[:confirmation_by_admin_id] != 0))   
  
    @users = User.confirmed

  end    
   

  def list_wait
    @users = User.registed 
  end  

  def list_fines
    @users = User.penalized
  end

  protected

  # If you have extra params to permit, append them to the sanitizer.
  
       
end
