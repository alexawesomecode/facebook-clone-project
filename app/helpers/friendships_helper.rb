module FriendshipsHelper

  def get_friends(user)
    friends = []

    user.senders.each do |sender|
      friends << User.find_by(id: sender.receiver) if sender.status == true
    end

    user.receivers.each do |receiver|
      friends << User.find_by(id: receiver.sender) if receiver.status == true
    end

    return friends
  end
end
