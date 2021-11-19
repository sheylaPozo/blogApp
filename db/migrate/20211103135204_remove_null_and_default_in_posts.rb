class RemoveNullAndDefaultInPosts < ActiveRecord::Migration[6.1]
  def change
    change_column_null :posts, :title, true
    change_column_null :posts, :text, true
  end
end
