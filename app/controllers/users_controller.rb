class UsersController < ApplicationController
  skip_before_action :verify_authenticity_token

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
  end
end
