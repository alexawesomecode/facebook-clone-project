class PostlikesController < ApplicationController

  def new
    @postlike = Postlike.new
  end

  def create
    @user = User.find(params[:id])
    print 'current user: '
    p @user
    @postlike = @user.postlikes.build(post_id: params[:postlike][:post_id])
    redirect_to request.referrer || root_url
  end

  def destroy
    @postlike = Postlike.find(params[:id])
    @postlike.destroy
    redirect_to request.referrer || root_url
  end
end
