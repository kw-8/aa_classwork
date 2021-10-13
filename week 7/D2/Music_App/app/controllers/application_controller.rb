class ApplicationController < ActionController::Base
  def current_user
    @current_user = User.find_by(session_token: session[:session_token])
  end

  def logged_in? # looked up by session_token
    current_user != nil
  end

  #reset cookie and user.session_token
  def log_in_user!(a_user)
    session[:session_token] = a_user.reset_session_token!
  end

  def log_out
    session[:session_token] = nil
    current_user.reset_session_token! #if @ hasn't been set
    @current_user = nil
  end

  # redirect if need a specific state
  def require_logged_in
    redirect_to new_session_url unless logged_in?
  end

  def require_logged_out
    log_out if logged_in?
  end
end
