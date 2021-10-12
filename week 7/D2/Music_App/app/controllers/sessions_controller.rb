class SessionsController < ApplicationController

  def new
    log_in_user!
  end

  def create
    if logged_in?
      redirect_to user_url(user)
    else
      redirect_to new_session_url
    end
  end

  def destroy
  end
end
