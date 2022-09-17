class Api::PostsController < ApplicationController
  before_action :set_post, only: %i[show]
  def index
    @user = User.find(params[:user_id]).includes(:posts)
    @posts = @user.posts
    if @posts.empty?
      render json: { message: 'No posts yet' }, status: :not_found
    else
      render json: @posts
    end
  end

  def show
    @post = Post.find(params[:id]).includes(:comments)
    @comments = @post.comments
    if @comments.empty?
      render json: { message: 'No comments yet' }, status: :not_found
    else
      render json: @comments
    end
  end

  def set_post
    @post = Post.find(params[:id])
  end
end
