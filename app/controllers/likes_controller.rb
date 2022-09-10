class LikesController < ApplicationController
  def create
    @post = Post.find(params[:id])
    @like = @post.likes.build
    @like.author = current_user

    redirect_to user_posts_path(current_user) if @like.save
  end
end
