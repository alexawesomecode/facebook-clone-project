class Postlike < ApplicationRecord
  # Association with User
  belongs_to :user, foreign_key: 'user_id'

  # Association with Post
  belongs_to :post, foreign_key: 'post_id'
end
