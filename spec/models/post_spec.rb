require 'rails_helper'

RSpec.describe Post, type: :model do
  email_shuffle = 'user' + rand(0..1000).to_s + '@example.com'
  user = User.new(email: email_shuffle, password: 'foobar')
  user.save
  post0 = Post.new(content: 'something', creator: user.id)
  post1 = Post.new(content: '', creator: user.id)
  post2 = Post.new(content: 'something')

  it 'is valid if it has a content and a creator' do
    expect(post0.save).to be_truthy
  end

  it 'is invalid if its content is empty' do
    expect(post1.save).to be_falsy
  end

  it "is invalid if it doesn't have a creator" do
    expect(post2.save).to be_falsy
  end

  it 'associates creator to user.id' do
    user_id = user.id
    post_new = Post.new(content: 'some valid users', creator: user.id)
    expect(post_new.creator).to eql(user_id)
  end
end
