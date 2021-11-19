class RemoveTitleAndTextDefaultInPosts < ActiveRecord::Migration[6.1]
  def change
    change_column_default :posts, :title, nil
    change_column_default :posts, :text, nil
  end
end
