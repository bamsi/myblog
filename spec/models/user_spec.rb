require 'rails_helper'

RSpec.describe User, type: :model do
  subject do
    described_class.new(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.')
  end

  it 'is not valid without name' do
    subject.name = nil
    expect(subject).to_not be_valid
  end
  it 'is not valid post_count is less equal 0' do
    subject.posts_counter = 0
    expect(subject).to_not be_valid
  end
end
