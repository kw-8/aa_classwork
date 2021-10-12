class ApplicationController < ActionController::Base
  # if you want to keep refreshing and getting the new session token, with a global method current_user
  def current_user
    @current_user = User.find_by(session_token: session[:session_token])
  end
end
