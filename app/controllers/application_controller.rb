# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :conected, if: proc { logged_in? && (current_user.last_action.nil? || current_user.last_action < 15.minutes.ago) }
  helper_method %i[current_user logged_in?]

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
    current_user.update_column(:last_action, Time.now )
  end
end
