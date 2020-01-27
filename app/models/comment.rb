class Comment < ApplicationRecord
  validates :comment_content, presence: true
  validates :post_id, presence: true

  # Association with Post
  belongs_to :post, foreign_key: 'post_id'

  # Association with User
  belongs_to :user, foreign_key: 'comment_creator'

  # Associations with Commentlike
  has_many :comment_like, foreign_key: 'comment_id'
  has_many :likes, through: :comment_like, source: :user_id
end
