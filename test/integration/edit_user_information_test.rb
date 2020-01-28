class EditUserInformation < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers
  test 'edit user information' do
    @user = users(:player_two)
    sign_in @user
    post user_registration_path, params: { name: 'David Letterman', current_password: '123456' }
  end
end
