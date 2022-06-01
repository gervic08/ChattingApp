# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :set_user, only: %i[show update edit destroy create]
  before_action :require_user, only: %i[update edit]
  before_action :require_same_user, only: %i[update edit destroy]
  
  def show
    @user
  end

  def new
    if logged_in?
      flash[:error] = "User already exists"
      redirect_to edit_user_path(current_user)
    end
    @user = User.new
  end

  def create
    redirect_to edit_user_path if logged_in?
    @user = User.create(user_params)
    if @user.save
      flash[:success] = "User successfully created"
      redirect_to @user
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    @user = User.update(user_params)
    if @user.save
      flash[:success] = "User successfully updated"
      redirect_to @user
    else
      render 'edit'
    end
  end

  def destroy 
    if @user.destroy
      flash.now[:success] = "User successfully deleted"
      redirect_to root_path
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :password)
  end

  def set_user
    @user = User.find(params[:id])
  end

  def require_same_user
    @user.id == current_user
  end
end