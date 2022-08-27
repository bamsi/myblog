class Post < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :comments
  has_many :likes

  Validate :title, presence: true
  Validate :title, length: { maximum: 250 }
  Validate :comments_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  Validate :likes_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  after_save :update_post

  # A method that updates the posts counter for a user.
  def update_post
    user.increment!(:post_counter)
  end

  # A method which returns the 5 most recent comments for a given post.
  def recent_posts(post_id)
    Post.find(post_id).comment.last(5)
  end
end
