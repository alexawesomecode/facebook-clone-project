require 'rails_helper'

RSpec.describe 'EditUserInformations', type: :request do
  user = User.new(email: '222222s@ss33ss.com', password: '202020', last_name: 'Piar')
  user.save

  it 'edit for last_name is valid' do
    post new_user_session_path, params: { user: { email: user.email,
                                                  password: user.password } }
    post user_registration_path(user), params: { user: { last_name: 'Letterman', current_password: '202020' } }

    expect(user.last_name).to eql('Letterman')
  end
end
