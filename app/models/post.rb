class Post < ApplicationRecord
  belongs_to :user
  has_many :comment
  has_many :likes

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
