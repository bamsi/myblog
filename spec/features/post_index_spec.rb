require 'rails_helper'

RSpec.describe Post, type: :feature do
  before :each do
    @user = User.new(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.', posts_counter: 0)
    @post = Post.new(author: @user, title: 'Hello', text: 'This is my first post', comments_counter: 0, likes_counter: 0)
    @post.save!
    @post.comments.create!(text: 'First comment', author: @user, post: @post)
    visit user_posts_path(@user.id)
  end

  
  context 'Post index page' do
    it 'I can see the users username' do
      expect(page).to have_content('Tom')
    end

    it 'I can see the users profile picture' do
      expect(page.html).to include('F_-0BxGuVvo')
    end

    it 'I can see the number of posts the user has written' do
      expect(page).to have_content('Number of posts: 1')
    end

    it 'I can see a posts title' do
      expect(page).to have_content('Hello')
    end

    it 'I can see some of the posts body' do
      expect(page).to have_content('This is my first post')
    end

    it 'I can see the first comments on a post' do
      expect(page).to have_content('First comment')
    end

    it 'I can see how many comments a post has' do
      expect(page).to have_content('Comments: 1')
    end

    it 'I can see how many likes a post has' do
      expect(page).to have_content('Likes: 0')
    end

    it 'When I click on a post, it redirects me to that posts show page' do
      click_link 'Hello'
      expect(page).to have_content('This is my first post')
    end
  end

end