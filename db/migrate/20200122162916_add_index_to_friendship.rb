class AddIndexToFriendship < ActiveRecord::Migration[6.0]
  def change
    add_index :friendships, :id
  end
end
