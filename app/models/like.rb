class Like < ApplicationRecord
  belongs_to :author, class_name: 'User'
  belongs_to :post
  after_save :update_likes

  # A method that updates the likes counter for a post.
  def update_likes
    post.increment!(:likes_counter)
  end
end
