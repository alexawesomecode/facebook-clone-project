class CreateFriendships < ActiveRecord::Migration[6.0]
  def change
    create_table :friendships do |t|
      t.boolean :status
      t.integer :sender
      t.integer :receiver

      t.timestamps
    end
  end
end
