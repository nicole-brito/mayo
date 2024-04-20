class PasswordResetsController < ApplicationController
  def create
    user = User.find_by_email(params[:email])
    if user
      user.generate_password_token!
      UserMailer.password_reset(user) # Altere esta linha
    end
    render json: { status: 'Email sent with password reset instructions' }, status: :ok
  end

    def update
      user = User.find_by_reset_password_token(params[:token])
      if user&.password_token_valid?
        user.reset_password!(params[:password])
        render json: { status: 'Password reset successful' }, status: :ok
      else
        render json: { error: 'Invalid token or token has expired' }, status: :unprocessable_entity
      end
    end
end
