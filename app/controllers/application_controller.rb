class ApplicationController < ActionController::Base
  include Pagy::Backend
  before_action :configure_permitted_parameters, if: :devise_controller?
  helper_method :current_user

  before_action :set_locale

  def  set_locale
    I18n.locale = params[:lang]
  end


  def require_user
    unless current_user
      flash[:alert] = t('devise.failure.unauthenticated')
      redirect_to root_path
    end
  end


  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name])
    devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name])
  end

end