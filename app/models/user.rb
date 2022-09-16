class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :post
  has_many :comments, foreign_key: 'author_id'

  validates :name, presence: true
  validates :posts_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  def is?(requested_role)
    role == requested_role.to_s
  end

  # A method that returns the 3 most recent posts for a given user.
  def recent_posts(author_id)
    user = User.find(author_id)
    Post.where('author_id = ?', user.id).last(3)
  end
end
