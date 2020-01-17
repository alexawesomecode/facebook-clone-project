class UserController < ApplicationController
  def show
    require 'date'
    @user = User.find(params[:id])
  end

    # private

    #   def user_params
    #     params.require(:user).permit(:email, :password, :first_name,
    #                                  :last_name, :image, :birthday)
    #   end
end
