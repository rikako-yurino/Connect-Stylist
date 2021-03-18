class RoomsController < ApplicationController
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
  end

  private
  def room_params
    params.require(:room).permit(:purpose_id, :style_id, :remarks)
  end
end
