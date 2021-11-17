class Api::SessionsController < ApplicationController
  def create
    @user = User.find_by_credentials(params[:user][:username],params[:user][:password])
    if @user
      login(@user)
      # render something
    else
      # render errors
    end
  end

  def destroy
    if logged_in?
      logout
      render {}
    else
      render json status: 404 #missing error component
    end
  end
end
