class CreateSandwichImages < ActiveRecord::Migration[5.2]
  def change
    create_table :sandwich_images do |t|
      t.integer :sandwich_id, null: false
      t.string :image_id, null: false
      t.index ["sandwich_id"], name: "index_sandwich_images_on_sandwich_id"

      t.timestamps null: false
    end
  end
end
