class Admin::PersonController < ApplicationController
before_action :authenticate_user! # for devise
before_action :find_user,only: [:show,:edit,:update]
load_and_authorize_resource :user

layout "admin"

  
  def edit    
  end

  def show 
   
  end

  def update
    
     if @user.save(user_params)
      if @user.errors.empty?
        redirect_to admin_person_path(@user) ,:notice => "Administator was successfully updated"
      end  
     else
        render 'edit'
     end 

  end

 private
    def find_user
      @user = User.find(params[:id])
    end
    def user_params
      params.require(:user).permit(:first_name, :last_name, :birthdate,:email)
    end

end
