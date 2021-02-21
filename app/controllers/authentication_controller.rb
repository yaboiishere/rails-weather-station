class AuthenticationController < ApplicationController
  skip_before_action :authenticate_request

  def authenticate
    data = params.require(:authentication).permit(:email, :password)
    command = AuthenticateUser.call(data[:email], data[:password])
    print command.success?
    if command.success?
      render json: { auth_token: command.result }
    else
      render json: { error: command.errors }, status: :unauthorized
    end
  end
end