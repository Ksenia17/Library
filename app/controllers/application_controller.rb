class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
   before_action :configure_permitted_parameters, if: :devise_controller?

  protected

 # def after_sign_in_path_for(resource)
 #   current_user_path
 # end

 # def after_sign_out_path_for(resource_or_scope)
 #   request.referrer
 # end

  def configure_permitted_parameters
    # Permit the `subscribe_newsletter` parameter along with the other
    # sign up parameters.
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :birthdate])
  end



end
