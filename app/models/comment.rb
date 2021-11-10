class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post

  after_create :update_count

  def update_counter
    post.update(comments_counter: post.comments.size)
  end
end
