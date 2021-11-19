class RemoveNullAndDefaultInUsers < ActiveRecord::Migration[6.1]
  def change
    change_column_null :users, :name, true
    change_column_null :users, :bio, true
  end
end
