class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post

  after_save :update_counter

  def update_counter
    post.update(comments_counter: post.comments.size)
  end
end
