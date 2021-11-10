module PostsHelper
  def comments?(post)
    return 'list-comments' if post.comments.exists?

    'no-list-comments'
  end
end
