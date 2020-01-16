require 'rails_helper'

RSpec.describe "UsersSigninAndCreatePosts", type: :request do

  describe "User Signin" do

    user = User.new(email:'user@newuser.com', password:'202020')
    user.save

    it "valid sign in with right password and email" do
      post new_user_session_path, params: { user: { email: 'user@newuser.com', 
                                                    password:  '202020'}}
      expect(flash[:notice]).to eql('Signed in successfully.')
      expect(user_signed_in?).to be_truthy
    end

    it "invalid sign in with wrong password and and correct email" do
      post new_user_session_path, params: { user: { email: 'user@newuser.com', 
                                                    password:  'invalidsd'}}
      expect(flash[:notice]).not_to eql('Signed in successfully.')
    end


  end
end
