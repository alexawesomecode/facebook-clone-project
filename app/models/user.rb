class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # Associationd with Post and Postlike
  has_many :posts, foreign_key: 'creator'
  has_many :postlike, foreign_key: 'user_id'
  has_many :post_id, through: :postlike

  # Association with Comments and Commentlike
  has_many :comments, foreign_key: 'comment_creator'
  has_many :comment_like, foreign_key: 'user_id'
  has_many :comment_id, through: :comment_like
end
