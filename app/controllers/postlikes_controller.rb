class PostlikesController < ApplicationController
  def new
    @postlike = Postlike.new
  end

  def create
    @postlike = Postlike.new(post_id: params[:post_information][:post_id],
                             user_id: params[:post_information][:user_id])

    redirect_to request.referrer || root_url if @postlike.save
  end

  def destroy
    @postlike = Postlike.find(params[:id])
    @postlike.destroy
    redirect_to request.referrer || root_url
  end
end
