class Post < ApplicationRecord
  validates :content, presence: true
  belongs_to :user, foreign_key: 'creator'
end




