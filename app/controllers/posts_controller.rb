class PostsController < ApplicationController
  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.build(content: params[:post][:content], picture: params[:post][:picture])
    if @post.save
      flash[:success] = 'Post created.'
      redirect_to root_url
    else
      flash[:danger] = 'Something went wrong, please try again.'
      render 'post'
    end
  end

  def index
    @user_friends = get_all_friends_id(current_user)
    @posts = Post.where('creator IN (?)', @user_friends)
  end
end
