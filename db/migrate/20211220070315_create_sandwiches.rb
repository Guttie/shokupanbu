class CreateSandwiches < ActiveRecord::Migration[5.2]
  def change
    create_table :sandwiches do |t|
      t.string :name, null: false
      t.text :review, null: false
      t.integer :user_id, null: false

      t.timestamps null: false
    end
  end
end
