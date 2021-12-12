class CreateContacts < ActiveRecord::Migration[5.2]
  def change
    create_table :contacts do |t|
      t.string :name, null: false
      t.string :email, null: false
      t.integer :subject, default: 0, null: false
      t.text :matter, null: false
      t.timestamps null: false
    end
  end
end
