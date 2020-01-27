class CommentLike < ApplicationRecord

  # Association with User
  belongs_to :user, foreign_key: 'user_id'

  # Association with Comment
  belongs_to :comment, foreign_key: 'comment_id'
end
