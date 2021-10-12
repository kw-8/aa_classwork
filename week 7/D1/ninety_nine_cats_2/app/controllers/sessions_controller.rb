class SessionsController < ApplicationController
  def new
    render :new
  end

  def create
    # returns user object or nil
    @user = User.find_by_credentials(
      params[:user][:user_name],
      params[:user][:password]
    )
    if @user.nil?
      # pass errors into html
      flash.now[:errors] = ['invalid username or password']
      render :new
    else
      user.reset_session_token!
      # session is space on the browser; json formats
      session[:session_token] = user.session_token
      redirect_to user_url(@user)
    end
  end

  def destroy

    redirect_to new_session_url
  end
end
