class PostsController < ApplicationController
  load_and_authorize_resource

  def index
    @user = User.find(params[:user_id])
    @posts = @user.top_most_recent_posts
  end

  def show
    @user = User.find(params[:user_id])
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    new_post = Post.new(post_params)
    current_user.posts << new_post
    if new_post.save
      flash[:notice] = 'Post created!'
      redirect_to user_posts_path(new_post.user.id)
    else
      flash.now[:alert] = 'Failed to create post!'
      render :new
    end
  end

  def destroy
    post_to_delete = Post.find(params[:id])
    owner = post_to_delete.user
    if post_to_delete.destroy
      flash[:notice] = 'Post destroyed successfully!'
    else
      flash[:alert] = 'Unable to delete post'
    end
    redirect_to user_posts_path(owner.id)
  end

  private

  def post_params
    params.require(:post).permit(:title, :text)
  end
end
