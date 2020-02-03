class CommentsController < ApplicationController
  def new
    @comment = Comment.new
    @post = Post.find(params[:post_id])
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

  def destroy
    @comment = Comment.find(params[:id])

    @comment.comment_like.each(&:destroy)

    @comment.destroy
    flash[:success] = 'Comment deleted.'
    redirect_to request.referrer || root_url
  end

  def edit
    @comment = Comment.find(params[:id])
    @post = @comment.post
  end

  def update
    comment = Comment.find(params[:id])
    comment.comment_content = params[:comment][:comment_content]
    comment.save
    redirect_to root_url
  end
end
