module FriendshipsHelper
  def get_friends(user)
    friends = []

    user.senders.each do |sender|
      friends << User.find_by(id: sender.receiver) if sender.status == true
    end

    friends
  end

  def pending_friendship(user)
    friends = []

    user.receivers.each do |receiver|
      friends << User.find_by(id: receiver.sender) if receiver.status == false
    end

    friends
  end

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

  def get_inverse(friendship)
    Friendship.find_by(sender: friendship.receiver, receiver: friendship.sender)
  end
end
