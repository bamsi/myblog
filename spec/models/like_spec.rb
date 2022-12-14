require 'rails_helper'

RSpec.describe Like, type: :model do
  user = User.new(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.',
                  posts_counter: 0)
  post = Post.new(author: user, title: 'Hello', text: 'This is my first post', comments_counter: 0, likes_counter: 0)
  post.save!
  post.likes.create!(author: user, post:)

  it 'is counting the number of likes for a given post' do
    expect(post.likes.length).to eql(1)
  end
end
