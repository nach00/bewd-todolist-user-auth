class UsersController < ApplicationController
  def create
    @user = User.new(user_params)

    if @user.save
      render :create, status: :created
    else
      render json: { errors: @user.errors }, status: :unprocessable_entity
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :password)
  end
end
