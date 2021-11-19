module ApplicationHelper
  def comments_with_user(comments)
    comments.includes(:user)
  end

  def post_liked_by?(args)
    post = args[:post]
    id = args[:id]
    post.likes.exists?(user_id: id)
  end

  def capitalize(title)
    title.capitalize
  end

  def shorten_text(text)
    text.truncate(22)
  end

  def can_display_comments?(count)
    count.positive?
  end
end
