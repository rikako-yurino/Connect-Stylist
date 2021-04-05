class MessageBroadcastJob < ApplicationJob
  queue_as :default

  def perform(message)
    ActionCable.server.broadcast "room_channel_#{message.room_id}", message: render_message(message)
  end

  private
  def render_message(message)
    if message.user_id.present?
      binding.pry
      ApplicationController.render_with_signed_in_user(message.user, 'messages/message', locals: { message: message })
    elsif message.stylist_id.present?
      binding.pry
      ApplicationController.render_with_signed_in_stylist(message.stylist, 'messages/message', locals: { message: message })
    end
  end
end