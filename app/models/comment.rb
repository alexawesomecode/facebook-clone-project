class Comment < ApplicationRecord
    belongs_to :post, foreign_key: 'post_id'
    belongs_to :user, foreign_key: 'comment_creator'
    has_many :comment_like, foreign_key: 'comment_id'
    has_many :likes, through: :comment_like, source: :user_id
    
end
