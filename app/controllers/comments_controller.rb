class CommentsController < ApplicationController

  def new
    @comment = Comment.new
  end

  def create
    @comment = current_user.comments.build(comment_content: params[:comment][:comment_content], 
                                           post_id: params[:post_id])
    if @comment.save 
      redirect_to root_url
    else
      redirect_to new_post_comment_path(params[:post_id])
    end
  end
end
