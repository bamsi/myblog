require 'rails_helper'

RSpec.describe PostsController, type: :request do
  before do
    @user = User.create(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.')
  end

  describe 'GET #index' do
    it 'returns a 200 status code' do
      subject { get :index }
      expect(subject).to have_http_status(200)
    end
    it 'render post template' do
      subject { get :index, params: { user_id: @user.id } }
      expect(subject).to render_template('index')
    end

    it 'the response body includes correct placeholder' do
      subject { get :index, params: { user_id: @user.id } }
      expect(subject.body).to include('Here is a list of users')
    end
  end

  describe 'GET #show' do
    it 'returns a 200 status code' do
      subject { get :show, params: { id: @user.id } }
      expect(subject).to have_http_status(200)
    end

    it 'render show template' do
      subject { get :show, params: { id: @user.id } }
      expect(subject).to render_template('show')
    end

    it 'the response body includes correct placeholder' do
      subject { get :index, params: { user_id: @user.id } }
      expect(subject.body).to include('Here is the details for a user')
    end
  end
end
