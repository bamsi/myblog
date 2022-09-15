require 'rails_helper'

RSpec.describe User, type: :feature do
  before :each do
    @user = User.new(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.',
                     posts_counter: 0)
    @post = Post.new(author: @user, title: 'Hello', text: 'This is my first post', comments_counter: 0,
                     likes_counter: 0)
    @post.save!
    visit user_path(@user.id)
  end

  context 'User show page' do
    it 'I can see the users profile picture' do
      expect(page.html).to include('F_-0BxGuVvo')
    end

    it 'I can see the users username' do
      expect(page).to have_content('Tom')
    end

    it 'I can see the number of posts the user has written' do
      expect(page).to have_content('Number of posts: 1')
    end

    it 'I can see the users bio' do
      expect(page).to have_content('Teacher from Mexico')
    end

    it 'I can see the users first 3 posts' do
      expect(page).to have_content('Number of posts: 1')
    end

    it 'I can see a button that lets me view all of a users posts' do
      expect(page).to have_content('See all posts')
    end

    it 'When I click a users post, it redirects me to that posts show page' do
      click_link 'Hello'
      expect(page).to have_content('This is my first post')
    end

    it 'When I click to see all posts, it redirects me to the users posts index page' do
      click_button 'See all posts'
      expect(page).to have_content('This is my first post')
    end
  end
end
