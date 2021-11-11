class LikesController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @like = @post.likes.create(user_id: current_user.id)

    redirect_back(fallback_location: root_path)
  end
end
