class PostsController < ApplicationController

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.build(content: params[:post][:content])
    if @post.save 
      redirect_to root_url
    else
      render 'post'
    end
  end

  def index
    @user_friends = get_all_friends_id(current_user)
    @posts = Post.where("creator IN (?)", @user_friends)
  end

end
