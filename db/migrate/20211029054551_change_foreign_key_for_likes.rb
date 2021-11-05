class ChangeForeignKeyForLikes < ActiveRecord::Migration[6.1]
  def change
    rename_column :likes, :user_id, :author_id
  end
end
