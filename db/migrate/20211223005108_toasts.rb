class Toasts < ActiveRecord::Migration[5.2]
  def change
    drop_table :toasts
    drop_table :toast_images
    drop_table :sandwiches
    drop_table :sandwich_images
  end
end
