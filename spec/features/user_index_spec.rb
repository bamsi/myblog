require 'rails_helper'

RSpec.describe User, type: :feature do
  before :each do
    @user = User.new(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.', posts_counter: 0)
    @post = Post.new(author: @user, title: 'Hello', text: 'This is my first post', comments_counter: 0, likes_counter: 0)
    @post.save!
    visit users_path
  end

  
  context 'User index page' do
    it 'I can see the username of all other users' do
      expect(page).to have_content('Tom')
    end

    it 'I can see the profile picture for each user' do
      expect(page.html).to include('F_-0BxGuVvo')
    end

    it 'I can see the number of posts each user has written' do
      expect(page).to have_content('Number of posts: 1')
    end

    it 'When I click on a user, I am redirected to that users show page' do
      click_link 'Tom'
      expect(page).to have_content('This is my first post')
    end
  end

end