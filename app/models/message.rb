class Message < ApplicationRecord
  belongs_to :room
  belongs_to :user, optional: true
  belongs_to :stylist, optional: true
  has_one_attached :image
  validates :content, presence: true, length: { maximum: 500 }, unless: :was_attached?
  
  # after_create_commit { MessageBroadcastJob.perform_later self }
  def template
    ApplicationController.renderer.render partial: 'messages/message', locals: { message: self }
  end

  def was_attached?
    self.image.attached?
  end
end
