class CreateComments < ActiveRecord::Migration[6.0]
  def change
    create_table :comments do |t|
      t.string :comment_content
      t.integer :post_id
      t.integer :comment_creator

      t.timestamps
    end
  end
end
