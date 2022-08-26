class Post < ApplicationRecord
  belongs_to: user
  has_many: user, through: :comment
end