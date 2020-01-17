class UserController < ApplicationController
  before_action :authenticate_user!

  def show
    require 'date'
    @user = User.find(params[:id])
  end

  def index
    @users = User.all
  end
end
