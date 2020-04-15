class Admin::InfoController < ApplicationController
 before_action :authenticate_user! # for devise
 before_action :find_user,only: [:show,:edit,:update,:destroy]
 load_and_authorize_resource :user
 

 layout "admin"
 

  def index
   @users = User.administrated
   # @users = User.where(includes(:users_roles).where(users_roles: {role_id: Role.adm_role.id}))  
  end

  def show
   # @user = User.find(params[:id])
   unless @user
   render text: "User not found", status: 404
   end
  end 

  def edit
   #  @user = User.find(params[:id])
  end

  def update
   #  @user = User.find(params[:id])
     
     if  @user.update(user_params)
        if @user.errors.empty?
          redirect_to admin_info_path(@user), :notice => I18n.t('notice.update_admin')  #"Administrator was successfully updated"               
        end       
       else
        @errors = @user.errors
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
