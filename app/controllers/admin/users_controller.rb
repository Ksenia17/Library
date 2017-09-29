class Admin::UsersController < ApplicationController  # AdminController
 before_action :authenticate_user! # for devise
 #before_action :auth, :set_current_user
 #after_action :unset_current_user


# load_and_authorize_resource # for cancancan

  layout "admin"
  
   def wait
  #  binding.pry
     @user = User.find(params[:id])
   end 

  def index   #Список уже зарегистрированных
  
   # @users = User.confirmed
      
      @users = User.where("confirmation_time is not null") # lfor find
    #  @users = User.find_all_by_confirmation_time!("nil")

  end    
  

  def confirm
             
    # binding.pry  
     @user = User.find(params[:id]) # это индекс имени,под которым я заходила,а не выбранный индекс в отфильтрованном scope
     @user.confirmation_time = Time.now
    # binding.pry 
     
     if  @user.save
         # на стр зарегистрированных
         redirect_to admin_users_path , :notice => "User was successfully registered" 
      else # на стр. неподтвержденных пользователей 
          redirect_to list_wait_admin_users_path
     end

   end 

  def list_wait   # здесь отражается некорректно!
   @users = User.where("confirmation_by_admin_id is null").includes(:users_roles).where(users_roles: {role_id: Role.user_role.id})
   #binding.pry
  #  @users = User.none_registed.user_yes  #Список, ожидающих регистрацию
    
  end  
  

  def list_fines
   # @users = User.penalized
   @users = User.where ("penalty_time is not null")
  end
   
   def list_admin
    #  @users = User.administrated
      @users = User.includes(:users_roles).where(users_roles: {role_id: Role.adm_role.id})
    end 
 

 private

  def load_user
      @user = User.find(current_user.id)
    end

    def user_params
      params.require(:user).permit(:first_name, :last_name, :birthdate,:email)
    end

end
