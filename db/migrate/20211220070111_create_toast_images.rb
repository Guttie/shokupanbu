class CreateToastImages < ActiveRecord::Migration[5.2]
  def change
    create_table :toast_images do |t|
      t.integer :toast_id, null: false
      t.string :image_id, null: false
      t.index ["toast_id"], name: "index_toast_images_on_toast_id"
      
      t.timestamps null: false
    end
  end
end
