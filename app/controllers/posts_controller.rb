class PostsController < ApplicationController
  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.build(content: params[:post][:content], 
                                     picture: params[:post][:picture])
    if @post.save
      flash[:success] = 'Post created.'
      redirect_to root_url
    else
      flash[:danger] = 'Something went wrong, please try again.'
      redirect_to request.referrer || root_url
    end
  end

  def index
    @user_friends = get_all_friends_id(current_user)
    @posts = Post.where('creator IN (?)', @user_friends)
  end

  def destroy
    @post = Post.find(params[:id])

    @post.comments.each do |comment|
      comment.destroy
    end

    @post.postlike.each do |like|
      like.destroy
    end

    @post.destroy
    flash[:success] = 'Post deleted.'
    redirect_to request.referrer || root_url
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    post = Post.find(params[:id])
    post.content = params[:post][:content]
    post.save
    redirect_to root_url
  end
end
