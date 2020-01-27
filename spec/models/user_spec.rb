require 'rails_helper'

RSpec.describe User, type: :model do
  user0 = User.new(email: 'user3@example.com', password: 'foobar')
  user1 = User.new(password: 'foobar')
  user2 = User.new(email: 'user4@example.com')
  user3 = User.new(email: 'user5@example.com', password: 'fooba')
  user4 = user0.dup

  it 'is valid if it has an email and a password' do
    expect(user0.save).to be_truthy
  end

  it "is invalid if it doesn't have an email address" do
    expect(user1.save).to be_falsy
  end

  it "is invalid if it doesn't have a password" do
    expect(user2.save).to be_falsy
  end

  it 'is invalid if its password has less than 6 digits' do
    expect(user3.save).to be_falsy
  end

  it 'is invalid if it is an account that already exists' do
    user0.save
    expect(user4.save).to be_falsy
  end
end
