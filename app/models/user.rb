class User < ApplicationRecord
  has_many :post
  has_many :comments, foreign_key: 'author_id'

  validates :name, presence: true
  validates :posts_counter, numericality: { only_integer: true, greater_than: 0 }

  # A method that returns the 3 most recent posts for a given user.
  def recent_posts(author_id)
    user = User.find(author_id)
    Post.where('author_id = ?', user.id).last(5)
  end
end
