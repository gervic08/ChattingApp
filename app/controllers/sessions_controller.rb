# frozen_string_literal: true

class SessionsController < ApplicationController
  before_action :logged_in_redirect, only: %i[new create]
  after_action :messages_blank, only: %i[create]

  def new
  end

  def create
    user = User.find_by(username: params[:session][:username]) 
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      session[:user_id][:starting] = Process.clock_gettime(Process::CLOCK_MONOTONIC)
      flash[:success] = "You´re successfully logged in."
      redirect_to root_path
    else
      flash.now[:error] = "Invalid credentials. Please try again."
      render 'new'
    end 
  end

  def destroy
    session[:user_id][:ending] = Process.clock_gettime(Process::CLOCK_MONOTONIC)
    session[:user_id] = nil
    flash[:error] = "Succesfully logged out"
    redirect_to root_path
  end

  private

  def logged_in_redirect
    if logged_in?
      flash[:error] = "You´re already logged in"
      redirect_to root_path
    end
  end

  def messages_blank
    current_user.messages = [] if current_user && current_user.messages
  end
end
