class Api::UsersController < ApplicationController
  def create
    user_params = params.require(:user).permit(:username, :password)
    @user = User.new(user_params)
    if @user.save
      login(@user)
      # redirect_to 
      render json: @user
    else
      # return error
      render json: @user.errors.full_messages
    end
  end
end
