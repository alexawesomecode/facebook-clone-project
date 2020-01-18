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
    @posts = Post.all
  end

  def show
  end
end
