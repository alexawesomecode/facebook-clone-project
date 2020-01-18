class Post < ApplicationRecord
  validates :content, presence: true

  belongs_to :user, foreign_key: 'creator'
  has_many :postlike, foreign_key: 'post_id'
  has_many :likes, through: :postlike, source: :user_id
end




