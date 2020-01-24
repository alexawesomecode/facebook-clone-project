ENV['RAILS_ENV'] ||= 'test'
require_relative '../config/environment'
require 'rails/test_help'

class ActiveSupport::TestCase
  # Run tests in parallel with specified workers
  parallelize(workers: :number_of_processors)

  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  def pending_friendship(user)
    friends = []

    user.receivers.each do |receiver|
      friends << User.find_by(id: receiver.sender) if receiver.status == false
    end

    friends
  end

  def get_friendship(user, user_friend)
    Friendship.find_by(sender: user.id, receiver: user_friend.id) ||
      Friendship.find_by(sender: user_friend.id, receiver: user.id)
  end

  # Add more helper methods to be used by all tests here...
end
