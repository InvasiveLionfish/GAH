class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def is_member?
    if is_logged_in?
      return Player.find(session[:user_id]).type=="Member"
    else false
    end
  end

  def is_logged_in?
    session[:user_id]
  end






end
