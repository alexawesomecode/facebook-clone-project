class Post < ApplicationRecord

    belongs_to :user, foreign_key: 'creator'
end




