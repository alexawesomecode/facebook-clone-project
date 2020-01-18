class CommentsController < ApplicationController

  def new
    @comment = Comments.new
  end

  def create
    @comment = current_user.comment.build(content: params[:comment][:content])
    if @comment.save 
      redirect_to root_url
    else
      render 'comment'
    end
  end
end
