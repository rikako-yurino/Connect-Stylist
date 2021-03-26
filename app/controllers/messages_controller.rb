class MessagesController < ApplicationController
  before_action :set_params, only:[:show, :create]
  
  def show
    @message = @room.messages.new(message_params)
    @messages = Message.where(room_id: @room.id)
  end

  def create
    @message = @room.messages.new(message_params)
    if @message.save
      redirect_to room_path(@room)
    else
      @messages = Message.where(room_id: @room.id)
      render :index
    end
    ActionCable.server.broadcast 'room_channel', message: @message.template
  end

  private
  def message_params
    if user_signed_in?
      params.require(:message).permit(:content, :room_id, :image).merge(user_id: current_user.id,)
    elsif stylist_signed_in?
      params.require(:message).permit(:content, :room_id, :image).merge(stylist_id: current_stylist.id)
    end
  end

  def set_params
    @room = Room.find(params[:room_id])
  end
end
