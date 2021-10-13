class UsersController < ApplicationController

  def new
    render :new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      # log_in_user!
      redirect_to user_url(@user)
    else
      redirect_to new_user_url
    end
  end

  def show
    @user = User.find(params[:id])
    redirect_to user_url(@user)
  end

  def user_params
    params.require(:user).permit(:email, :password)
  end

end
