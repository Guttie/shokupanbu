class Post < ApplicationRecord

  enum category: { shop: 0, toast: 1, sandwich: 2 }

  belongs_to :user
  has_many :post_images, dependent: :destroy
  accepts_attachments_for :post_images, attachment: :image
end
