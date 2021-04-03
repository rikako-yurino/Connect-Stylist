class RoomChannel < ApplicationCable::Channel
  def subscribed
    stream_from "room_channel_#{params['room']}" 
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def speak(data)
    # messageに代入
    message = Message.create! content: data['message'], user_id: current_user.id, room_id: params['room']
    # messageをbroadcastする
    ActionCable.server.broadcast "room_channel_#{params['room']}", message: render_message(message)
  end

  private
  def render_message(message)
    ApplicationController.renderer.render(partial: 'messages/message', locals: { message: message })
  end
end