class FriendshipsController < ApplicationController
  def new
    @friendships = Friendship.new
  end

  def create
    @new_friendship = Friendship.new(sender:params[:friend_information][:sender], 
                                     receiver: params[:friend_information][:receiver], status: 0)
    if @new_friendship.save 
      redirect_to request.referrer || root_url
    end
  end

  def edit
    @fs = Friendship.find_by(id: params[:id])
    @fs.status = !@fs.status
    if @fs.save 
      redirect_to request.referrer || root_url
    end
  end

  def destroy
    @fs = Friendship.find_by(id: params[:id])
    @fs.destroy
    redirect_to request.referrer || root_url
  end
end
