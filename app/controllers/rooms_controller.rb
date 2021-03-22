class RoomsController < ApplicationController
  before_action :authenticate_user!
  
  def new
    @room = Room.new
  end

  def create
    @room = Room.new(room_params)
    if @room.save
      redirect_to room_path(@room)
    else
      render :new
    end
  end

  def show
    @message = Message.new
    # @messages = Message.where(room_id: @room.id)
    @room = Room.find(params[:id])
  end

  def destroy
    room = Room.find(params[:id])
    room.destroy
    redirect_to root_path
  end

  private
  def room_params
    params.require(:room).permit(:purpose_id, :style_id, :remark, :room_id).merge(user_id: current_user.id)
  end
end
