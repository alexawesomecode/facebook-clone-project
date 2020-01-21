class Friendship < ApplicationRecord


belongs_to :user, foreign_key: 'sender'
belongs_to :user, foreign_key: 'receiver'

end
