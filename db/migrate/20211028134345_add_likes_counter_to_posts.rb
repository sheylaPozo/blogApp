class AddLikesCounterToPosts < ActiveRecord::Migration[6.1]
  def change
    add_column :posts, :likes_counter, :integer
  end
end
