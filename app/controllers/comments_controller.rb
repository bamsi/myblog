class CommentsController < ApplicationController
  def new
    @comment = Comment.new
  end

  def create
    @post = Post.find(params[:id])
    @comment = @post.comments.build(comment_params)
    @comment.author = current_user

    redirect_to user_post_path(current_user, @post) if @comment.save
  end

  def comment_params
    params.require(:comment).permit(:text)
  end
end
