class Users::RegistrationsController < Devise::RegistrationsController
  before_action :configure_sign_up_params, only: [:create]

  def new
    build_resource({})
    yield resource if block_given?
    respond_with resource
  end

  def configure_sign_up_params
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[full_name email password password_confirmation])
  end

  def after_sign_up_path_for(resource)
    categories_path
  end

  def after_sign_in_path_for(resource)
    stored_location_for(resource) || categories_path
  end
end
