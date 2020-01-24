class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, 
         :omniauthable, omniauth_providers: %i[facebook]

  # Associationd with Post and Postlike
  has_many :posts, foreign_key: 'creator'
  has_many :postlike, foreign_key: 'user_id'
  has_many :post_id, through: :postlike

  # Association with Comments and Commentlike
  has_many :comments, foreign_key: 'comment_creator'
  has_many :comment_like, foreign_key: 'user_id'
  has_many :comment_id, through: :comment_like


  # Associations with Friends
  
  
  has_many :senders, class_name: 'Friendship', foreign_key: 'sender'
  has_many :receivers, class_name: 'Friendship', foreign_key: 'receiver'

  # def self.from_omniauth(auth)
  #   where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
  #     user.email = auth.info.email
  #     user.password = Devise.friendly_token[0, 20]
  #     user.first_name = auth.info.name   # assuming the user model has a name
  #     user.last_name = auth.info.name
  #     user.image = auth.info.image # assuming the user model has an image
  #     # If you are using confirmable and the provider(s) you use validate emails, 
  #     # uncomment the line below to skip the confirmation emails.
  #     # user.skip_confirmation!
  #   end
  # end

def self.from_omniauth(auth)
    where(auth.slice(:provider, :uid)).first_or_initialize.tap do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.email = auth.info.email
      user.first_name = auth.info.name
      user.password = Devise.friendly_token[0, 20]
      # user.oauth_token = auth.credentials.token
      # user.oauth_expires_at = Time.at(auth.credentials.expires_at)
      user.save!
    end
  end

  def self.new_with_session(params, session)
    super.tap do |user|
      if data = session["devise.facebook_data"] && session["devise.facebook_data"]["extra"]["raw_info"]
        user.email = data["email"] if user.email.blank?
      end
    end
  end

end
