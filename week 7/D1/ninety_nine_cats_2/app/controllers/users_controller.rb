class UsersController < ApplicationController
  def new
    render :new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to cats_url(user.cats)
  end

  def show
    User.find_by(params[:id])
    render :index
  end

  def delete
    render :index
  end

  def update
    render :index
  end

  def user_params
    params.require(:user).permit(:user_name, :password)
  end
end
