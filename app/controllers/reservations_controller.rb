class ReservationsController < ApplicationController
  before_action :authenticate_user!

  def new
    @reservation_room = ReservationRoom.new
  end

  def confirm
    @reservation_room = ReservationRoom.new(reservation_params)
    @time_zone = TimeZone.find_by(id: @reservation_room.time_zone_id)
    @purpose = TimeZone.find_by(id: @reservation_room.purpose_id)
    @purpose = Purpose.find_by(id: @reservation_room.purpose_id)
    @style = Style.find_by(id: @reservation_room.style_id)
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
    binding.pry
    @user = User.where(user_id: current_user.id)
    @rooms = Room.includes(:user)
  end

  private
  def reservation_params
    params.require(:reservation_room).permit(:reservation_date, :time_zone_id, :purpose_id, :style_id, :remarks, :room_id).merge(user_id: current_user.id)
  end
end
