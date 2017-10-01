class Admin::InfoController < ApplicationController
 before_action :authenticate_user! # for devise
 load_and_authorize_resource :user
 
 layout "admin"


  def index
    @users = User.administrated
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
     @user = User.find(params[:id])
  end

  def update
     @user = User.find(params[:id])
     
     if  @user.update(user_params)
        if @user.errors.empty?
          redirect_to admin_info_path(@user), :notice => "Administrator was successfully updated"       
        end
     else
       render 'edit'
    end 
  end


private

    def user_params
      params.require(:user).permit(:first_name, :last_name, :birthdate,:email)
    end


end
