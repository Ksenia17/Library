class Admin::UsersController < ApplicationController  # AdminController
 before_action :authenticate_user! # for devise
# load_and_authorize_resource # for cancancan


  layout "admin"

  def show
    @user = User.find(params[:id])
  end

  def index   #Список уже зарегистрированных
  
    @users = User.confirmed

  end    
   

  def list_wait
    @users = User.none_registed.user_yes  #Список, ожидающих регистрацию
  end  

  def list_fines
    @users = User.penalized
  end
    
       
end
