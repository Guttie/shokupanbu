class CreateBookmarks < ActiveRecord::Migration[5.2]
  def change
    create_table :bookmarks do |t|
      t.references :user, foreign_key: true, null: false
      t.references :shop, foreign_key: true, null: false
      t.references :toast, foreign_key: true, null: false
      t.references :sandwich, foreign_key: true, null: false

      t.timestamps
    end
  end
end
