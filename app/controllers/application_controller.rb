class ApplicationController < ActionController::Base
  include Pagy::Backend

  helper_method :current_user

  def after_sign_in_path_for(resource)
    articles_path
  end

  def after_sign_out_path_for(resource)
    root_path
  end

  def require_user
    unless current_user
      flash[:alert] = "You must be logged in to perform that action"
      redirect_to sign_in
    end
  end

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name])
    devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name])
  end

end