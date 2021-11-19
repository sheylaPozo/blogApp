class CommentsController < ApplicationController
  load_and_authorize_resource

  def create
    post = Post.find(params[:post_id])
    new_comment = Comment.create(user_id: current_user.id, post_id: post.id, text: comment_params[:text])
    if new_comment.save
      flash[:notice] = 'Comment created!'
      redirect_to user_post_path(post.user.id, post.id)
    else
      flash.now[:error] = 'Unable to create comment!'
      redirect_to user_post_path(post.user.id, post.id), alert: 'Failed to add comment!'
    end
  end

  def destroy
    previous_url = request.env['HTTP_REFERER']
    comment_to_delete = Comment.find(params[:id])

    if comment_to_delete.destroy
      flash[:notice] = 'Comment destroyed successfully!'
    else
      flash[:alert] = 'Unable to delete comment'
    end
    redirect_to(previous_url)
  end

  private

  def comment_params
    params.require(:data).permit(:text)
  end
end
