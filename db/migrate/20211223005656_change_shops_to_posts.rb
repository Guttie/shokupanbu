class ChangeShopsToPosts < ActiveRecord::Migration[5.2]
  def change
    rename_table :shops, :posts
  end
end
