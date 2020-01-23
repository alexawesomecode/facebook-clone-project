module PostsHelper

def get_all_friends_id(user)

        @friends = Friendship.where('status == true AND sender == ?', user.id)
        @friends_id = @friends.map {|item| [item.receiver, item.sender]}.flatten.uniq!
        return @friends_id
        
end
      
end
