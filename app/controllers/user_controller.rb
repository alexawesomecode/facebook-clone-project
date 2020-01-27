class UserController < ApplicationController
  def show
    @user = User.find(params[:id])
  end

  def index
    @users = User.all
  end

  private

    def complete_delete(id)
      friends = Friendship.select { |f| f.sender == id or f.receiver == id }
      friends.each do |friend|
        friend.destroy
      end

      comments = Comment.select { |c| c.comment_creator == id }
      comments.each do |comment|
        comment.destroy
      end

      posts = Posts.select { |p| p.creator == id }
      posts.each do |post|
        post.destroy
      end

      commlikes = CommentLike.select { |cml| cml.user_id == id }
      commlikes.each do |cl|
        cl.destroy
      end

      postl = Postlike.select { |plk| plk.user_id == id }
      postl.each do |pl|
        pl.destroy
      end
    end
end
