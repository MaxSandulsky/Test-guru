class ApplicationController < ActionController::Base
  protect_from_forgery with: :null_session

  before_action :store_target_path!, unless: :devise_controller?
  before_action :configure_permitted_parameters, if: :devise_controller?

  def after_sign_in_path_for(resource)
    target_path = stored_location_for(resource)
    if target_path != '/'
      target_path
    elsif resource.is_a?(Admin)
      admin_tests_path
    else
      tests_path
    end
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[first_name last_name email password])
  end

  def store_target_path!
    store_location_for(:user, request.fullpath)
  end
end
