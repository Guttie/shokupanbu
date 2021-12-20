class Sandwich < ApplicationRecord
  belongs_to :user

  has_many :sandwich_images, dependent: :destroy
  accepts_attachments_for :sandwich_images, attachment: :image
end
