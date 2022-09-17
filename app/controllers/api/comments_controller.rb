class Api::CommentsController < ApplicationController
  # set  protect_from_forgery to :null_session
  protect_from_forgery with: :null_session
  def index
    @comments = Comment.all
    render json: @comments
  end

  def new
    @comment = Comment.new
  end

  def create
    comment = Comment.new(comment_params)
    render json: comment, status: 'created' if comment.save
  end

  private

  def comment_params
    params.require(:comment).permit(:text, :author_id, :post_id)
  end
end
