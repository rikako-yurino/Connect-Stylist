class ReservationsController < ApplicationController
  before_action :authenticate_user!

  def new
    @reservation_room = ReservationRoom.new
  end

  def confirm
    @reservation_room = ReservationRoom.new(reservation_params)
  end

  def create
    @reservation_room = ReservationRoom.new(reservation_params)
    if @reservation_room.valid?
      @reservation_room.save
      render :show 
    else
      render :new
    end
  end

  def show
  end

  def destroy
    reservation = Reservation.find(params[:id])
    reservation.destroy
    redirect_to "/reservations/#{reservation.id}/rooms/#{room.id} "
  end

  def maypage
    @user = User.where(user_id: current_user.id)
  end

  private
  def reservation_params
    params.require(:reservation_room).permit(:reservation_date, :time_zone_id, :purpose_id, :style_id, :remarks, :room_id).merge(user_id: current_user.id)
  end
end
