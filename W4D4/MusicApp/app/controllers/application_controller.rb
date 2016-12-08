class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def current_user
    @current_user ||= User.find_by_session_token(session[:session_token])
  end

  def login_user!(user)
    new_session_token = User.generate_session_token
    @current_user.session_token = new_session_token
    session[:session_token] = new_session_token
  end

  def logged_in?
    self.session_token == session[:session_token]
  end

  def logout_user!
    @current_user.reset_session_token!
    session[:session_token] = nil
  end
end
