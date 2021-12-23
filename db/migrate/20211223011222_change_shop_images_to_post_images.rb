class ChangeShopImagesToPostImages < ActiveRecord::Migration[5.2]
  def change
    rename_table :shop_images, :post_images
  end
end
