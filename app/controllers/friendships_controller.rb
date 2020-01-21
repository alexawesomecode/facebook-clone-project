class FriendshipsController < ApplicationController
  def new
    @friendships = Friendship.new
  end

  def create

    @new_friendship = Friendship.new(sender:params[:friend_information][:sender], receiver: params[:friend_information][:receiver], status: 0)
    @new_friendship.save

  end

  def edit
  end

  def destroy
  end
end
