class StylistsController < ApplicationController
  def index
    @rooms = Room.all
    @reservations = Reservation.order(reservation_date: :asc)
  end

  def show
    @reservation = Reservation.find(params[:id])
    @room = Room.find_by(reservation_id: @reservation.id)
    if @room.update(stylist_id: current_stylist.id) 
      # redirect_to " /reservations/#{@reservation.id}/rooms/#{@room.id}"
    end
  end

end
