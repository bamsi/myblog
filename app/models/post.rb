class Post < ApplicationRecord
  
  belongs_to :author, class_name: 'User'
  has_many :comments
  has_many :likes

  validates :title, presence: true
  validates :title, length: { maximum: 250 }
  validates :comments_counter, numericality: { only_integer: true }, comparison: { greater_than_or_equal_to: 0 }
  validates :likes_counter, numericality: { only_integer: true }, comparison: { greater_than_or_equal_to: 0 }

  after_save :update_post

  # A method that updates the posts counter for a user.
  def update_post
    author.increment!(:posts_counter)
  end

  # A method which returns the 5 most recent comments for a given post.
  def recent_comments(post_id)
    post = Post.find(post_id)
    Comment.includes(:author).where('post_id = ?', post.id).last(5)
  end
end
