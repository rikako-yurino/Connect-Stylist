class RoomsController < ApplicationController

def show
  @message = Message.new
  @messages = Message.all
  @room = Room.find_by(params[:id])
  @reservation = Reservation.find(@room.reservation_id)
  # @messages = @room.messages.includes(:user)
  if user_signed_in?
    cookies.signed['user_id'] = nil
    cookies.signed['user_id'] = current_user.id
  elsif stylist_signed_in?
    cookies.signed['stylist_id'] = nil
    cookies.signed['stylist_id'] = current_stylist.id
  end
  end

  def destroy
    room = Room.find(params[:id])
    room.destroy
    redirect_to reservation_room_path(@room.id)
  end

end
