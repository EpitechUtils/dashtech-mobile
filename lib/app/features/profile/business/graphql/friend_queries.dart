final String isFriendRequestedWith = """
  query isFriendRequestedWith(\$username: String!) {
    userIsFriendRequested(username: \$username)
  }
""";

final String requestNewFriend = """
  query requestNewFriend(\$username: String!) {
    userSendFriendRequest(username: \$username)
  }
""";
