class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :current_user, :logged_in?

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end #current_user

  def logged_in?
    !!current_user
  end # logged_in

  def authorize
    unless logged_in?
      redirect_to new_session_path
  end
  end
end
