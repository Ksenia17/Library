class Admin::UsersController < ApplicationController  # AdminController
 before_action :authenticate_user! # for devise
# load_and_authorize_resource # for cancancan


  layout "admin"
 

  def index   #Список уже зарегистрированных
  
   # @users = User.confirmed
      
      @users = User.where("confirmation_time is not null") # lfor find
    #  @users = User.find_all_by_confirmation_time!("nil")

  end    
  

  def confirm
     # здесь надо подхватить параметр: id из текущего scope? как?
        
     binding.pry
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

  def list_wait
    @users = User.none_registed.user_yes  #Список, ожидающих регистрацию
    
  end  

  def update
     
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
    def new_parametr
     
    end

end
