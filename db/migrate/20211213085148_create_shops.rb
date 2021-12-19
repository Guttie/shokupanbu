class CreateShops < ActiveRecord::Migration[5.2]
  def change
    create_table :shops do |t|
      t.string :name, null: false
      t.string :image_id, null: false
      t.text :review, null: false
      t.integer :user_id, null: false

      t.timestamps  null: false
    end
  end
end
