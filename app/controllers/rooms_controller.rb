class RoomsController < ApplicationController
  def index
    @current_user = current_user
    redirect_to '/users/sign_in' unless @current_user
    @rooms = Room.public_rooms
    @users = User.all_except(@current_user)
  end

  def new
    @room = Room.new
    @message = Message.new
  end

  def create
    @room = Room.create(name: params[:name])
  end

  def show
    @current_user = current_user
    @single_room = Room.find(params[:id])
    @rooms = Room.public_rooms
    @users = User.all_except(@current_user)
    @room = Room.new
    @messages = @single_room.messages

    render "index"
  end
end
