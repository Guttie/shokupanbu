class ChangeDatatypeCategoryOfPost < ActiveRecord::Migration[5.2]
  def change
    change_column :posts, :category, :integer
  end
end
