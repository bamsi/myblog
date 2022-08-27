class User < ApplicationRecord
  has_many :post
  has_many :comments, foreign_key: 'author_id'

  Validate :name, presence: true
  Validate :posts_counter, comparison: {greater_than: 0}

  #A method that returns the 3 most recent posts for a given user.
  def recent_posts(user_id)
    User.find(user_id).post.last(5)
  end
end

