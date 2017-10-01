class Admin::UsersController < ApplicationController  # AdminController
 before_action :authenticate_user! # for devise
 load_and_authorize_resource :user
 
  layout "admin"
  
   def wait
      @user = User.find(params[:id])
   end 

   def show
     @user = User.find(params[:id])
   end 

  def index   #Список уже зарегистрированных
     @users = User.where("confirmation_time is not null")  # @users = User.confirmed
  end    
  
  def edit #редактирование уже зарегистрированных
     @user = User.find(params[:id])
  end

  def update # обновление уже зарегистрированных
     @user = User.find(params[:id])
     
     if  @user.update(user_params)
        if @user.errors.empty?
          redirect_to admin_user_path(@user), :notice => "User was successfully updated"       
        end
     else
       render 'edit'
    end 
    

  end

  def confirm
     
     @user = User.find(params[:id]) # это индекс имени,под которым я заходила,а не выбранный индекс в отфильтрованном scope
     @user.confirmation_time = Time.now
     @user.confirmation_by_admin_id = current_user.id
       
     if  @user.save
         # на стр зарегистрированных
         redirect_to admin_users_path , :notice => "User was successfully registered" 
      else # на стр. неподтвержденных пользователей 
          redirect_to list_wait_admin_users_path
     end

   end 

  def list_wait   # здесь отражается некорректно!
   @users = User.where("confirmation_by_admin_id is null").includes(:users_roles).where(users_roles: {role_id: Role.user_role.id})
   
   # @users = User.none_registed.user_yes  #Список, ожидающих регистрацию
    
  end  
  

  def list_fines
   # @users = User.penalized
   @users = User.where ("penalty_time is not null")
  end
   
 #  def list_admin
    #  @users = User.administrated
 #     @users = User.includes(:users_roles).where(users_roles: {role_id: Role.adm_role.id})
 #   end 
 

 private

 # def load_user
 #     @user = User.find(current_user.id)
 #   end

    def user_params
      params.require(:user).permit(:first_name, :last_name, :birthdate,:email)
    end

end
