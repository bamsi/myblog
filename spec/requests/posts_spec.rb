require 'rails_helper'

RSpec.describe PostsController, type: :request do
  before(:each) do
    @user = User.create(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.',
                        posts_counter: 1)
    @post = Post.create(title: 'Title', text: 'Body', author_id: @user.id, comments_counter: 0, likes_counter: 0)
    @post.save!
  end

  describe 'GET #index' do
    it 'returns a 200 status code' do
      get user_posts_path(user_id: @user.id)
      expect(response).to have_http_status(200)
    end
    it 'render post template' do
      get user_posts_path(user_id: @user.id)
      expect(response).to render_template('index')
    end

    it 'the response body includes correct placeholder' do
      get user_posts_path(user_id: @user.id)
      expect(response.body).not_to  include('Here is a list of posts for a given user')
    end
  end

  describe 'GET #show' do
    it 'returns a 200 status code' do
      get user_post_path(user_id: @user.id, id: @post.id)
      expect(response).to have_http_status(200)
    end

    it 'render show template' do
      get user_post_path(user_id: @user.id, id: @post.id)
      expect(subject).to render_template('show')
    end
    it 'the response body includes correct placeholder' do
      get user_post_path(user_id: @user.id, id: @post.id)
      expect(response.body).not_to  include('Here is a list of comments of the given user post')
    end
  end
end
