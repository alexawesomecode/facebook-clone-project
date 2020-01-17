class CommentLike < ApplicationRecord

    belongs_to :user, foreign_key: 'user_id'
    belongs_to :comment, foreign_key: 'comment_id'

end
