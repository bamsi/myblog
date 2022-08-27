require 'rails_helper'

RSpec.describe Post, type: :model do
  user = User.create(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.')
  user.save

  subject do
    described_class.new(author: user, title: 'Hello', text: 'This is my first post')
  end

  it 'is not valid without title' do
    subject.title = nil
    expect(subject).to_not be_valid
  end

  it 'is not valid when title length exceed 250' do
    text = 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut'
    subject.title = text + text + text
    expect(subject).to_not be_valid
  end

  it 'is not valid comments_counter is less than 0' do
    subject.comments_counter = -1
    expect(subject).to_not be_valid
  end

  it 'is not valid likes_counter is less than 0' do
    subject.likes_counter = -1
    expect(subject).to_not be_valid
  end
end
