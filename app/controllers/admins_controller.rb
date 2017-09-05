class AdminsController < ApplicationController
  
  layout "admin"

  def index
  
  #  @users = User.order("first_name")

   if params[:confirmation_by_admin_id]
    @users = User.where(["confirmation_by_admin_id != ?", nil]) 

   #  @users = User.where(:confirmation_by_admin_id => (params[:confirmation_by_admin_id] != 0))   
    end    
    
  
  
 
  end
end
