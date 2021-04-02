class MessagesController < ApplicationController
  # before_action :authenticate_user!
  before_action :set_params, only:[:show, :create]
  
  def show
    @messages = Message.includes(:user).order(:id)
    @message = current_user.messages.build
  end

  def create
    @message = @room.messages.create!(message_params)
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
