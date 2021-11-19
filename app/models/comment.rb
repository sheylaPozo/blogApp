class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post

  after_create :update_post_comments_counter
  after_destroy :update_post_comments_counter_after_destroy
  before_validation :trim_text

  def update_post_comments_counter
    post.update_column('comments_counter', post.comments_counter + 1)
  end

  def update_post_comments_counter_after_destroy
    post.update_column('comments_counter', post.comments_counter - 1)
  end

  private

  def trim_text
    self.text = text.strip if text.present?
  end
end
