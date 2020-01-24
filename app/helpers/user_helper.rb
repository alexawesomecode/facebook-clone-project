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
end
