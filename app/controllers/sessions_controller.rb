# frozen_string_literal: true

class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(username: params[:session][:username]) 
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      flash[:notice] = "You´re successfully logged in."
      redirect_to root_path
    else
      flash[:alert] = "Invalid credentials. Please try again."
      render 'new'
    end 
  end
end

def destroy
  session[:user_id] = nil
  flash[:alert] = "Succesfully logged out"
  redirect_to root_path
end