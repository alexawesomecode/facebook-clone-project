class PostInterfaceTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  test 'friendship creation and destruction' do
    @user = users(:player_two)
    @user_friend = users(:player_one)

    sign_in @user
    get user_path(@user_friend.id)
    post friendships_new_path(friend_information: { sender: @user.id, receiver: @user_friend.id })

    assert_equal @user.senders.first.status, false
    assert_equal @user.senders.first.sender, @user.id
    assert_equal @user.senders.first.receiver, @user_friend.id

    logout @user

    sign_in @user_friend
    get root_url
    assert_equal pending_friendship(@user_friend).first, @user
    assert_not Friendship.all.empty?
    delete friendship_path(get_friendship(@user, @user_friend).id)
    assert Friendship.all.empty?

    post friendships_new_path(friend_information: { sender: @user_friend.id, receiver: @user.id })
    logout @user_friend
    sign_in @user
    get edit_friendship_path(get_friendship(@user, @user_friend).id)
    assert Friendship.first.status
    assert Friendship.second.status
    assert_equal @user.senders.first.receiver, @user_friend.id
  end
end
