class UserController < ApplicationController
  def show
    @user = User.find(params[:id])
  end

  def index
    @users = User.all
  end

  private

  def complete_delete(id)
    friends = Friendship.select { |f| [f.sender, f.receiver].include?(id) }
    friends.each(&:destroy)

    comments = Comment.select { |c| c.comment_creator == id }
    comments.each(&:destroy)

    posts = Posts.select { |p| p.creator == id }
    posts.each(&:destroy)

    commlikes = CommentLike.select { |cml| cml.user_id == id }
    commlikes.each(&:destroy)

    postl = Postlike.select { |plk| plk.user_id == id }
    postl.each(&:destroy)
  end
end
