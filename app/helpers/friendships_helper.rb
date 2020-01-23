module FriendshipsHelper


  def friendship_status(user)
    if !current_user.receivers.empty?
      fs = current_user.receivers.select { |item| item.sender == user.id }
      if !fs.empty?
        return fs[0].status == false ? 'wasrequested' : 'friends'
      end
    end

    if !current_user.senders.empty?
      fs = current_user.senders.select { |item| item.receiver == user.id }
      if !fs.empty?
        return fs[0].status == false ? 'irequested' : 'friends'
      end
    end

    return nil
  end

  def get_friendship(user)
    relation = Friendship.find_by(sender:user.id, receiver:current_user.id) || 
               Friendship.find_by(sender:current_user.id, receiver:user.id) 
  end

  

end
