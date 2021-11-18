class PostsController < ApplicationController
  def index
    @user = User.where(id: params[:user_id]).includes(:posts).take
    # respond_to do |format|
    #   format.html { @user }
    #   format.json { json: @user }
    # end
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

  def destroy
    @post = Post.find(params[:id])
    authorize! :destroy, @post
    @post.destroy
    flash[:notice] = 'Post successfully deleted!'
    redirect_to root_path
  end

  private

  def post_params
    params.require(:post).permit(:title, :text)
  end
end
