class RemoveImageIdFromShops < ActiveRecord::Migration[5.2]
  def change
    remove_column :shops, :image_id, :string
  end
end
