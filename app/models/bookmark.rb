class Bookmark < ApplicationRecord
  belongs_to :user
  belongs_to :shop
  belongs_to :toast
  belongs_to :sandwich
  
  validates :user_id, uniqueness: {scope: :post_id},{ :toast_id} :sandwich_id }
end
