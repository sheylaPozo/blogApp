class Post < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy

  validates :title, presence: { message: 'Title must not be blank' },
                    length: { maximum: 250, too_long: 'Title must not exceed 250 characters' }
  validates_numericality_of :comments_counter, only_integer: true, greater_than_or_equal: 0
  validates_numericality_of :likes_counter, only_integer: true, greater_than_or_equal: 0

  after_create :update_post_counter
  after_destroy :update_post_counter_after_destroy
  before_validation :trim_text

  def update_post_counter
    user.update_column('posts_counter', user.posts_counter + 1)
  end

  def most_recent_comments(limit = 5)
    comments.order(created_at: :desc).limit(limit)
  end

  def update_post_counter_after_destroy
    user.update_column('posts_counter', user.posts_counter - 1)
  end

  private

  def trim_text
    self.title = title.strip if title.present?
    self.text = text.strip if text.present?
  end
end
