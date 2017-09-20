class Reader::UsersController < ApplicationController  # AdminController
  before_action :authenticate_user! # for devise
  load_and_authorize_resource :user # :users,:parent => false  # for cancancan - не вышло

  layout "reader"
  

  def edit
    @user = User.find(params[:id])
    
  end

  def show
     @user = User.find(params[:id])
     
  end
  
def update
   @user = User.find(params[:id])
    respond_to do |format| 
  #  @user = User.find(params[:id])
   # binding.pry
     if @user.update(user_params)
         format.html { redirect_to action: :update, notice: 'User was successfully updated.' }
      else
      format.html { render action: :edit }
    end  
  end
end 
 
private
  def user_params
    params.require(:user).permit(:first_name ,:last_name, :email,:birthdate)
  end 
  
   
       
end
