class Api::RegisterController < ApplicationController
  def create
    user = User.new(user_params)

    if user.save
      render json: { message: "User created successfully!" }, status: :ok
    else
      render json: { errors: user.errors.full_messages }, status: :bad_request
    end
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :username, :email, :password, :password_confirmation)
  end
end

