require 'rails_helper'

RSpec.describe Post, type: :feature do
  before :each do
    @user = User.new(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.',
                     posts_counter: 0)
    @post = Post.new(author: @user, title: 'Hello', text: 'This is my first post', comments_counter: 0,
                     likes_counter: 0)
    @post.save!
    @post.comments.create!(text: 'First comment', author: @user, post: @post)
    visit user_post_path(user_id: @user.id, id: @post.id)
  end

  context 'Post show page' do
    it 'I can see the posts title' do
      expect(page).to have_content('Hello')
    end

    it 'I can see who wrote the post' do
      expect(page).to have_content('Tom')
    end

    it 'I can see how many comments it has' do
      expect(page).to have_content('Comments: 1')
    end

    it 'I can see how many likes it has' do
      expect(page).to have_content('Likes: 0')
    end

    it 'I can see the post body' do
      expect(page).to have_content('This is my first post')
    end

    it 'I can see the username of each commentor' do
      expect(page).to have_content('Tom')
    end

    it 'I can see the comment each commentor left' do
      expect(page).to have_content('First comment')
    end
  end
end
