class RoomChannel < ApplicationCable::Channel
  def subscribed
    stream_from "room_channel_#{params['room']}" 
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def speak(data)
    binding.pry
    if defined? current_user
      Message.create! content: data['message'], user_id: current_user.id, room_id: params['room']
    elsif defined? current_stylist
      Message.create! content: data['message'], stylist_id: current_stylist.id, room_id: params['room']
    end
  end
end