class Bookmark < ApplicationRecord
  belongs_to :user
  belongs_to :post
  
  # 重複登録防止
  validates :user_id, uniqueness: { scope: :post_id }
end
