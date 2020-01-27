module UserHelper
  # Returns the Gravatar for the given user.
  def gravatar_for(user, options = { size: 200 })
    gravatar_id = Digest::MD5.hexdigest(user.email.downcase)
    size = options[:size]
    gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}?s=#{size}"
    image_tag(gravatar_url, alt: user.email, class: 'gravatar')
  end

  def age(birthday)
    age = Date.today.year - birthday.year
    Date.today < birthday + age.years ? age - 1 : age
  end

  def complete_delete(id)
    friends = Friendship.select { |f| f.sender == id or f.receiver == id }
    friends.each do |friend|
      friend.destroy
    end

    comments = Comment.select { |c| c.comment_creator == id }
    comments.each do |comment|
      comment.destroy
    end

    posts = Posts.select { |p| p.creator == id }
    posts.each do |post|
      post.destroy
    end

    commlikes = CommentLike.select { |cml| cml.user_id == id }
    commlikes.each do |cl|
      cl.destroy
    end

    postl = Postlike.select { |plk| plk.user_id == id }
    postl.each do |pl|
      pl.destroy
    end
  end
end
