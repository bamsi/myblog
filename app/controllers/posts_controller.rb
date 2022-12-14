class PostsController < ApplicationController
  load_and_authorize_resource

  def index
    @user = User.find(params[:user_id])
    @posts = Post.where('author_id = ?', params[:user_id])
  end

  def show
    @post = Post.find_by(id: params[:id], author_id: params[:user_id])
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.author = current_user
    @post.comments_counter = 0
    @post.likes_counter = 0
    redirect_to user_posts_path(current_user.id) if @post.save
  end

  def post_params
    params.require(:post).permit(:title, :text)
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
  end
end
