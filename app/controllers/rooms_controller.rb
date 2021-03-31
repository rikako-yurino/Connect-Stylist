class RoomsController < ApplicationController
  def show
    @message = Message.new
    @room = Room.find(params[:id])
    @messages = @room.messages.includes(:user)
  end

  def show_additionally
    last_id = params[:oldest_message_id].to_i - 1    
    @messages = Message.includes(:user).order(:id).where(id: 1..last_id).last(50)
  end

  def destroy
    room = Room.find(params[:id])
    room.destroy
    redirect_to root_path
  end
end
