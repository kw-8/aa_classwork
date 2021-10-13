class SessionsController < ApplicationController
  def new #login
    render :new
  end

  def create
    user = User.find_by_credentials(params[:user][:email],
                                    params[:user][:password])
    if user.nil?
      flash.now[:errors] = ["email or password incorrect"]
      render :new
    else
      log_in_user!(user)
      redirect_to user_url(user)
    end
  end

  def destroy
    log_out
    redirect_to new_session_url
  end
end
