class ApplicationController < ActionController::Base
  def current_user
  end

  def logged_in?
    return false if current_user.nil?
    current_user.session_token == session[:session_token]
  end

  #reset cookie and user.session_token
  def log_in_user!
    session[:session_token] = current_user.reset_session_token!
  end
end
