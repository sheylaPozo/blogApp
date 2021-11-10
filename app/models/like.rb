class Like < ApplicationRecord
  belongs_to :user
  belongs_to :post

  after_create :update_counter

  def update_counter
    post.update(likes_counter: post.likes.size)
  end
end
