class Post < ApplicationRecord
  belongs_to :user
  has_many :likes, dependent: :destroy
  has_many :comments, dependent: :destroy

  after_create :update_counter

  def update_counter
    user.update(posts_counter: user.posts.size)
  end

  def recent_comments
    comments.last(5)
  end
end
