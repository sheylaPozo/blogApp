class ChangeForeignKeyForComments < ActiveRecord::Migration[6.1]
  def change
    rename_column :comments, :user_id, :author_id
  end
end
