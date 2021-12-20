class ChangeNotnullToToasts < ActiveRecord::Migration[5.2]
  def change
    def up
      change_column_null :toasts, :name, false
      change_column_null :toasts, :review, false
      change_column_null :toasts, :user_id, false
    end
  
    def down
      change_column_null :toasts, :name, true
      change_column_null :toasts, :review, true
      change_column_null :toasts, :user_id, true
    end
  end
end
