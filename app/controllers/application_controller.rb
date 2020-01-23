class ApplicationController < ActionController::Base

  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?
  protect_from_forgery with: :exception
  add_flash_types :info, :error, :warning



  def get_all_friends_id(user)

   # @friends = Friendship.where('sender = ?', user.id)
    @friends_id = @friends.map {|item| [item.receiver, item.sender]}.flatten.uniq!
    return @friends_id
    
  end
  
    protected

    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :image, :birthday])
      devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name, :image, :birthday])
    end
end
