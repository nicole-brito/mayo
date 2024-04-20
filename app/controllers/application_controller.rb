class ApplicationController < ActionController::Base
  include Pagy::Backend
  before_action :authenticate_user!

  def require_user
    redirect_to '/login' unless current_user
  end

end
