class Users::RegistrationsController < Devise::RegistrationsController
    before_action :configure_sign_up_params, only: [:create]
  
    def new
      build_resource({})
      yield resource if block_given?
      respond_with resource
    end
  
    def configure_sign_up_params
      devise_parameter_sanitizer.permit(:sign_up, keys: [:full_name, :email, :password, :password_confirmation])
    end
  end
  