class RoomChannel < ApplicationCable::Channel
  def subscribed
    stream_from "room_channel_#{params['room']}" 
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def speak(data)
    if  current_user.present?
      message = Message.create! content: data['message'], user_id: current_user.id, room_id: params['room']
    elsif current_stylist.present?
      message = Message.create! content: data['message'], stylist_id: current_stylist.id, room_id: params['room']
    end
    ActionCable.server.broadcast "room_channel_#{message.room_id}", message: render_message(message), user_id: message.user_id, stylist_id: message.stylist_id, message_id: message.id 
  end

  private
  def render_message(message)
    if message.user_id.present?
      ApplicationController.render_with_signed_in_user(message.user, partial: 'messages/async_message', locals: { message: message })
    elsif message.stylist_id.present?
      ApplicationController.render_with_signed_in_stylist(message.stylist, partial: 'messages/async_message', locals: { message: message })
    end
  end
end