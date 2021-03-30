class ReservationsController < ApplicationController
  def new
    @reservation = Reservation.new
  end

  def create
    @reservation = Reservation.new(reservation_params)
    
    if @@reservation.save
      redirect_to room_path(@room)
    else
      render :new
    end
  end

  def show
  end

  private
  def reservation_params
    params.require(:reservation).permit(:date, :time_id).merge(user_id: current_user.id)
  end
end
