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
      
     if @user.update(user_params)
       if @user.errors.empty?
        
        redirect_to reader_user_path(current_user), :notice => I18n.t('notice.user_update') # "Пользователь был успешно обновлен"  # "User was successfully updated" 
        end
     else
       @errors = @user.errors
       
       render 'edit' 
     end
end 
 
private
  def user_params
    params.require(:user).permit(:first_name ,:last_name, :email,:birthdate)
  end 
  
   
       
end
