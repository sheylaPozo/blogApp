class PostsController < ApplicationController
  def index
    @user = User.where(id: params[:user_id]).includes(:posts).take
  end

  def show
    @post = Post.where(id: params[:id]).includes(:comments).take
  end

  def new
    @user = current_user
  end

  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      flash[:notice] = 'Post successfully created!'
      redirect_to user_post_path(user_id: @post.user_id, id: @post.id)
    else
      render :new
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :text)
  end
end
