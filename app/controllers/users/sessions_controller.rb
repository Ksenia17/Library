class Users::SessionsController < Devise::SessionsController
   before_action :configure_sign_in_params, only: [:create]

  def create
    self.resource = warden.authenticate!(auth_options)
    set_flash_message(:notice, :signed_in) if is_navigational_format?
    sign_in(resource_name, resource)
   # respond_with resource, :location => after_sign_in_path_for(resource)
    if :admin in current_user.roles:  #current_user.roles? :admin
      redirect_to admins_index_path
    elsif :user in current_user.roles: # current_user.roles? :user
      redirect_to books_path 
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
