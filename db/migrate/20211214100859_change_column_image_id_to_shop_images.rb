class ChangeColumnImageIdToShopImages < ActiveRecord::Migration[5.2]
  def change
    change_column :shop_images, :image_id, :string
  end
end
