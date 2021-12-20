class CreateToasts < ActiveRecord::Migration[5.2]
  def change
    create_table :toasts do |t|
      t.string :name
      t.text :review
      t.integer :user_id

      t.timestamps
    end
  end
end
