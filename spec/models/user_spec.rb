require 'rails_helper'

RSpec.describe User, type: :model do
  
  it "returns false if try to save user without partameters" do
    user = User.new
    assert !user.valid?
  end

  it "returns true if try to save user with partameters" do
    user = User.new(email: "user@example.com", password: "foobar")
    assert user.valid?
  end

  it "returns false if try to save two users with the same partameters" do
    user1 = User.new(email: "user@example.com", password: "foobar")
    user1.save
    user2 = user1.dup
    assert !user2.valid?
  end
end