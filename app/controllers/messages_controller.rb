# frozen_string_literal: true

class MessagesController < ApplicationController
  def create
    @message = current_user.messages.build(message_params)
    if @message.save
      redirect_to root_path
    end  
  end

  private

  def message_params
    params.require(:message).permit(:words)
  end
end