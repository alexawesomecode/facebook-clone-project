class CommentlikeController < ApplicationController

  def new
    @commentlike = CommentLike.new
  end
  
  def create
    @commentlike = CommentLike.new(comment_id: params[:comment_information][:comment_id],
                                   user_id: params[:comment_information][:user_id])
    if @commentlike.save
    redirect_to request.referrer || root_url
    end
  end
  
  def destroy
    @commentlike = CommentLike.find(params[:id])
    @commentlike.destroy
    redirect_to request.referrer || root_url
  end

end
