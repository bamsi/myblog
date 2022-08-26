class User < ApplicationRecord
  has_many: post
  has_many: post, through: :comment
end