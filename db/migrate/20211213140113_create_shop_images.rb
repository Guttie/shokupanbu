class CreateShopImages < ActiveRecord::Migration[5.2]
  def change
    create_table :shop_images do |t|
      t.integer :shop_id, null: false
      t.integer :image_id, null: false
      t.index ["shop_id"], name: "index_shop_images_on_shop_id"

      t.timestamps null: false
    end
  end
end
