module ApplicationHelper

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
end
