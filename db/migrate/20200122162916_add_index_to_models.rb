class AddIndexToModels < ActiveRecord::Migration[6.0]
  def change
    # Friendships table
    add_index :friendships,   :sender
    add_index :friendships,   :receiver

    # Comment_likes table
    add_index :comment_likes, :user_id
    add_index :comment_likes, :comment_id

    # Comments table
    add_index :comments,      :post_id

    # Postlikes table
    add_index :postlikes,     :user_id
    add_index :postlikes,     :post_id
  end
end
