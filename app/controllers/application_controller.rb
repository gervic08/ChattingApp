# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :conected, if: proc { current_user }
  helper_method %i[current_user logged_in? conected]

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def logged_in?
    !!current_user
  end

  def require_user
    if !logged_in?
      flash[:notice] = "You must be logged in to perform this action"
      redirect_to login_path
    end
  end

  def conected
    return last_action = Time.zone.now if logged_in?

    "User offline"
  end
end
