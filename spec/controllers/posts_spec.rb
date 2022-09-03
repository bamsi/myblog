require 'rails_helper'

RSpec.describe PostsController, type: :controller do
  before do
    @user = User.create(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.')
    @post = Post.create(title: 'Title', text: 'Body', author_id: @user.id)
  end

  describe 'GET #index' do
    it 'returns a 200 status code' do
      subject { get :index, params: { user_id: @user.id } }
      expect(subject).to have_http_status(200)
    end
    it 'render post template' do
      subject { get :index, params: { user_id: @user.id } }
      expect(subject).to render_template('index')
    end
  end

  describe 'GET #show' do
    it 'returns a 200 status code' do
      subject { get :show, params: { user_id: @user.id, id: @post.id } }
      expect(subject).to have_http_status(200)
    end

    it 'render show template' do
      subject { get :show, params: { user_id: @user.id, id: @post.id } }
      expect(subject).to render_template('show')
    end
  end
end
