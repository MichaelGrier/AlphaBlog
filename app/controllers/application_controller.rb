class ApplicationController < ActionController::Base
  helper_method :current_user, :logged_in? # makes helper method available to views

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def logged_in?
    !!current_user # if there is a current user, return true
  end
end
