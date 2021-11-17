class Api::SessionsController < ApplicationController
  def create
    @user = User.find_by_credentials(params[:user][:username],params[:user][:password])
    if @user
      login(@user)
      render json: {test:'successful login'}
      # render something
    else
      render json: {test:'bad login'}
      # render errors
    end
  end

  def destroy
    @user = current_user
    if logged_in?
      logout
      render json: {test:'successful logout'}
    else
      render json: {test:'bad logout'}
    end
  end
end
