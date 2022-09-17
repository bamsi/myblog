class Api::UsersController < ApplicationController
  # before_action :authorize_request, except: :create

  before_action :set_user, only: %i[show]

  def index
    @users = User.all

    if @users.empty?
      render json: { message: 'No users yet' }, status: :not_found
    else
      render json: @users
    end
  end

  def show
    @user = User.find(params[:id])
    @posts = Post.where('author_id=?', @user.id)

    if @posts.present?  
      render json: @posts
    else
      render json: { message: 'No posts yet' }, status: :not_found
    end
  end

  def set_user
    @user = User.find(params[:id])
  end
end
