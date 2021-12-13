class Shop < ApplicationRecord

  belongs_to :user

  has_many :shop_images, dependent: :destroy
  accepts_attachments_for :shop_images, attachment: :image
end
