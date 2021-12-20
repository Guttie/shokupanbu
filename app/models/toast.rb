class Toast < ApplicationRecord
  
  belongs_to :user
  
  has_many :toast_images, dependent: :destroy
  accepts_attachments_for :toast_images, attachment: :image
end
