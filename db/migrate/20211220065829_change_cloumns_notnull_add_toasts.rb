class ChangeCloumnsNotnullAddToasts < ActiveRecord::Migration[5.2]
  def change
    change_column :toasts, :name, :string, null: false
    change_column :toasts, :review, :text, null: false
    change_column :toasts, :user_id, :integer, null: false
  end
end
