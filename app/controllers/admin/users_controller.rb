class Admin::UsersController < ApplicationController  # AdminController
 before_action :authenticate_user! # for devise
# load_and_authorize_resource # for cancancan


  layout "admin"


  def edit_wait    
  end
  def update_wait    
  end


  def show
    @user = User.find(params[:id])
  end

  def update_admin
    # @user = User.find(params[:id]) не знаю нового параметра id
  end

  def edit_admin
   # @user = User.find(params[:id]) не знаю нового параметра id
   # if @user.save
   #  redirect_to list_admin_admin_users_path
   #  else
   #  render 'edit'
   #  end
  end

  def index   #Список уже зарегистрированных
  
    @users = User.confirmed

  end    
  

  def confirm
     # здесь надо подхватить параметр: id из текущего scope? как?
     
    # @user = User.none_registed.user_yes.find(new_parametr)  #params[:id] #  в тупике!
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
    @users = User.penalized
  end
   def list_admin
      @users = User.administrated
    end 
  

    private
    def new_parametr
     # params.require(:user).permit
    end

end
