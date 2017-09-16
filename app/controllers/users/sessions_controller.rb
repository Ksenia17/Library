class Users::SessionsController < Devise::SessionsController
   before_action :configure_sign_in_params, only: [:create, :show]

  def create
    self.resource = warden.authenticate!(auth_options)
    set_flash_message(:notice, :signed_in) if is_navigational_format?
    sign_in(resource_name, resource)
   # respond_with resource, :location => after_sign_in_path_for(resource)
  #  binding.pry  
    if current_user.roles.include?(Role.find_by_name(:admin))  
      redirect_to admin_users_path
    elsif current_user.roles.include?(Role.find_by_name(:user)) 
     # не прошло!
      if can? :read, Book 
        redirect_to reader_user_books_path(current_user)
      end
    end

  end

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

   protected

  # If you have extra params to permit, append them to the sanitizer.
  
   def configure_sign_in_params
     devise_parameter_sanitizer.permit(:sign_in, keys: [:first_name, :last_name, :birthdate])
   end
end
