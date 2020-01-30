class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?
  protect_from_forgery with: :exception

  helper_method :get_friendship
  helper_method :pending_friendship

  def get_friendship(user)
    Friendship.find_by(sender: user.id, receiver: current_user.id) ||
      Friendship.find_by(sender: current_user.id, receiver: user.id)
  end

  def pending_friendship(user)
    friends = []

    user.receivers.each do |receiver|
      if User.find_by(id: receiver.sender).nil?
        complete_delete(receiver.sender)
      elsif receiver.status == false
        friends << User.find_by(id: receiver.sender)
      end
    end

    friends
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[name image birthday password])
    devise_parameter_sanitizer.permit(:account_update, keys: %i[name image birthday password])
  end
end
