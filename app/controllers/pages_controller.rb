# frozen_string_literal: true

class PagesController < ApplicationController
  def home
    if logged_in?
      redirect_to root_path
    else
      redirect_to login_path 
    end
  end
end
