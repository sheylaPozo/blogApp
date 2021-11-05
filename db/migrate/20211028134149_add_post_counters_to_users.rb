class AddPostCountersToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :posts_counter, :integer
  end
end
