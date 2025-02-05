class Api::LoginController < ApplicationController
  def create
    user = User.find_by(email: params[:email])

    if user&.authenticate(params[:password])
      token = user.authentication_tokens.create!
      
      render json: { token: token.token, expires_at: token.expires_at }, status: :ok
    else
      render json: { error: "Invalid email or password" }, status: :bad_request
    end
  end
end
