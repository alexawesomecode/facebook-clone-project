module PostsHelper

  def get_friendship(user)
    Friendship.find_by(sender: user.id, receiver: current_user.id) ||
      Friendship.find_by(sender: current_user.id, receiver: user.id)
  end
end
