class AdminsController < ApplicationController
  
  layout "admin"

  def index
  #  @users = User.all
  #  @users = User.order("first_name")
  #  binding.pry

   if params[:confirmation_time]  # confirmation_by_admin_id
    
    @users = User.where(["confirmation_time != ?", nil]).order("first_name") 

   #  @users = User.where(:confirmation_by_admin_id => (params[:confirmation_by_admin_id] != 0))   
    end    
   

  def show
    if params[:confirmation_by_admin_id]  
    
    @users = User.where(["confirmation_by_admin_id == ?", nil]) 
    end

  end  
  
  
 
  end
end
