class ApplicationController < ActionController::Base


  def current_user
    @current_user ||= User.find_by(session_token: session[:session_token])
  end

  def require_login
    unless logged_in?
      redirect_to #Login page
    end
  end

  def login(username)
    current_user.reset_session_token!
  end

  def logout
    current_user.reset_session_token!
    session[:session_token] = nil
    @current_user = nil
  end

  def logged_in?
    !!@current_user
  end

end
