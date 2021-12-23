class Post < ApplicationRecord

  enum category: { shop: 0, toast: 1, sandwich: 2 }

  belongs_to :user
  has_many :post_images, dependent: :destroy
  has_many :bookmarks, dependent: :destroy
  accepts_attachments_for :post_images, attachment: :image

  def bookmarked_by?(user)
    #既にブックマークしていないか検証
    bookmarks.where(user_id: user.id).exists?
  end
end
