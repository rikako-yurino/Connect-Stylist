class Message < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :stylist, optional: true
  has_one_attached :image
  belongs_to :room

  validates :content, presence: true, length: { maximum: 500 }, unless: :was_attached?

  def template
    ApplicationController.renderer.render partial: 'messages/message', locals: { message: self }
  end

  def was_attached?
    self.image.attached?
  end
end
