class Post < ApplicationRecord
  mount_uploader :picture, PictureUploader
  validates :content, presence: true
  validate  :picture_size
  
  # Association with User
  belongs_to :user, foreign_key: 'creator'

  # Associations with Postlike
  has_many :postlike, foreign_key: 'post_id'
  has_many :likes, through: :postlike, source: :user_id

  # Association with Comment
  has_many :comments, foreign_key: 'post_id'

  default_scope { order(created_at: :desc) }

  # Validates the size of an uploaded picture.
  def picture_size
    if picture.size > 5.megabytes
      errors.add(:picture, "should be less than 5MB")
    end
  end
end
