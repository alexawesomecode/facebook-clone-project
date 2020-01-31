class StaticPagesController < ApplicationController
  def help
    @user_friends = get_friends(current_user)
  end

  def about
    @user_friends = get_friends(current_user)
  end

  def contact
    @user_friends = get_friends(current_user)
  end
end
