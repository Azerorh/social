class MessagesController < ApplicationController
  def create
    @current_user = current_user
    @message = @current_user.messages.create(content: params[:content], room_id: params[:room_id])
  end

end