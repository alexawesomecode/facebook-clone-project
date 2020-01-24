class FriendshipsController < ApplicationController
  def new
    @friendships = Friendship.new
  end

  def create
    if params[:friend_information][:sender] != params[:friend_information][:receiver]
      @new_friendship = Friendship.new(sender: params[:friend_information][:sender],
                                       receiver: params[:friend_information][:receiver], status: 0)
      redirect_to request.referrer || root_url if @new_friendship.save
    else
      flash[:danger] = 'You cant send an invitation to yourself!'
    end
  end

  def edit
    @fs = Friendship.find_by(id: params[:id])
    @fs.status = !@fs.status
    @fs.save
    @fs_inverse = Friendship.new(sender: @fs.receiver, receiver: @fs.sender, status: true)
    redirect_to request.referrer || root_url if @fs_inverse.save
  end

  def destroy
    @fs = Friendship.find_by(id: params[:id])
    if @fs.status
      @fs_inverse = get_inverse(@fs)
      @fs_inverse.destroy
    end
    @fs.destroy
    redirect_to request.referrer || root_url
  end
end
