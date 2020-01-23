module ApplicationHelper

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

end
