class MessagesController < ApplicationController
  before_action :set_params, only:[:show, :create]
  
  def show
    @message = @room.messages.new(message_params)
    @messages = @room.messages.includes(:user, :stylist)
  end

  def create
    @message = @room.messages.new(message_params)
    if @message.save
      redirect_to room_path(@room)
    else
      @messages = @room.messages.includes(:user, :stylist)
      render :index
    end
  end

  private

  def message_params
    params.require(:message).permit(:content,:room_id).merge(user_id: current_user.id)
  end

  def set_params
    @room = Room.find(params[:room_id])
  end
end
