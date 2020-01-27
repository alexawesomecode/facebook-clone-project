# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20_200_122_200_753) do
  # These are extensions that must be enabled in order to support this database
  enable_extension 'plpgsql'

  create_table 'comment_likes', force: :cascade do |t|
    t.integer 'user_id'
    t.integer 'comment_id'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.index ['comment_id'], name: 'index_comment_likes_on_comment_id'
    t.index ['user_id'], name: 'index_comment_likes_on_user_id'
  end

  create_table 'comments', force: :cascade do |t|
    t.string 'comment_content'
    t.integer 'post_id'
    t.integer 'comment_creator'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.index ['post_id'], name: 'index_comments_on_post_id'
  end

  create_table 'friendships', force: :cascade do |t|
    t.boolean 'status'
    t.integer 'sender'
    t.integer 'receiver'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.index ['receiver'], name: 'index_friendships_on_receiver'
    t.index ['sender'], name: 'index_friendships_on_sender'
  end

  create_table 'postlikes', force: :cascade do |t|
    t.integer 'user_id'
    t.integer 'post_id'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.index ['post_id'], name: 'index_postlikes_on_post_id'
    t.index ['user_id'], name: 'index_postlikes_on_user_id'
  end

  create_table 'posts', force: :cascade do |t|
    t.string 'content'
    t.integer 'creator'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
  end

  create_table 'users', force: :cascade do |t|
    t.string 'email', default: '', null: false
    t.string 'encrypted_password', default: '', null: false
    t.string 'reset_password_token'
    t.datetime 'reset_password_sent_at'
    t.datetime 'remember_created_at'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.string 'first_name'
    t.string 'last_name'
    t.date 'birthday'
    t.string 'image'
    t.string 'provider'
    t.string 'uid'
    t.index ['email'], name: 'index_users_on_email', unique: true
    t.index ['reset_password_token'], name: 'index_users_on_reset_password_token', unique: true
  end
end
