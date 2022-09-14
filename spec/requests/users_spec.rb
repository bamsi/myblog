require 'rails_helper'

RSpec.describe PostsController, type: :request do
  before do
    @user = User.create(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.',
                        posts_counter: 1)
    @user.save!
  end

  describe 'GET #index' do
    it 'returns a 200 status code' do
      get users_path
      expect(response).to have_http_status(200)
    end
    it 'render post template' do
      get users_path
      expect(response).to render_template('index')
    end

    it 'the response body includes correct placeholder' do
      get users_path
      expect(response.body).not_to  include('Here is a list of users')
    end
  end

  describe 'GET #show' do
    it 'returns a 200 status code' do
      get user_path(id: @user.id)
      expect(response).to have_http_status(200)
    end

    it 'render show template' do
      get user_path(id: @user.id)
      expect(response).to render_template('show')
    end

    it 'the response body includes correct placeholder' do
      get user_path(id: @user.id)
      expect(response.body).not_to  include('Here is the details for a user')
    end
  end
end
