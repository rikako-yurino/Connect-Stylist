class ReservationsController < ApplicationController
  def new
    @reservation_room = ReservationRoom.new
  end

  def create
    @reservation_room = ReservationRoom.new(resevation_params)
    if @reservation_room.valid?
      @reservation_room.save
      redirect_to 
    else
      render :new
    end
  end

  def show
  end

  private
  def resevation_params
    params.require(:reservation_room).permit(:date, :time_id, :purpose_id, :style_id, :remarks, :stylist).merge(user_id: current_user.id)
  end
end
