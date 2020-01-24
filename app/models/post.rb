class Post < ApplicationRecord
  validates :content, presence: true
  mount_uploader :picture, PictureUploader
  
  # Association with User
  belongs_to :user, foreign_key: 'creator'

  # Associations with Postlike
  has_many :postlike, foreign_key: 'post_id'
  has_many :likes, through: :postlike, source: :user_id

  # Association with Comment
  has_many :comments, foreign_key: 'post_id'

  default_scope { order(created_at: :desc) }
end
