module FriendshipsHelper
  def friendship_status(user)
    fs = current_user.receivers.select { |item| item.sender == user.id }
    unless fs.empty?
      return fs[0].status == false ? 'wasrequested' : 'friends'
    end

    fs = current_user.senders.select { |item| item.receiver == user.id }
    unless fs.empty?
      return fs[0].status == false ? 'irequested' : 'friends'
    end

    nil
  end

  def get_friendship(user)
    Friendship.find_by(sender: user.id, receiver: current_user.id) ||
      Friendship.find_by(sender: current_user.id, receiver: user.id)
  end

  def get_all_friends_id(user)
    friends = Friendship.select { |f| f.status == true and f.sender == user.id }
    @friends_id = []
    friends.each do |f|
      @friends_id << f.sender
      @friends_id << f.receiver
    end
    @friends_id = @friends_id == [] ? user.id : @friends_id.flatten.uniq
  end

  def pending_friendship(user)
    friends = []

    user.receivers.each do |receiver|
      if User.find_by(id: receiver.sender) == nil
        complete_delete(receiver.sender)
      else
        friends << User.find_by(id: receiver.sender) if receiver.status == false
      end
    end

    friends
  end

  def get_friends(user)
    friends = []

    user.senders.each do |sender|
      friends << User.find_by(id: sender.receiver) if sender.status == true
    end

    friends
  end
end
