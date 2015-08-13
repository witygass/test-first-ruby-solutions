class Friend
  # TODO: your code goes here!
  def greeting(otherFriend = nil)
    if !otherFriend.nil?
      "Hello, #{otherFriend}!"
    else
      'Hello!'
    end
  end
end
