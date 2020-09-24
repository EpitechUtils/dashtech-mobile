final String profileQuery = """
  query userByIdQuery{
    userById() {
      id
      username
      firstName
      lastName
      email
      gender
      birthDate
      credits
      gentlemanPercent
      avatarUrl
      address {
        id
        city
        address1
        address2
        postalCode
      }
    }
  }
""";

final String getFriends = """
  query userFriends {
    userFriends() {
      id
      username
      avatarUrl
      gentlemanPercent
    }
  }
""";

final String getFriendRequests = """
  query userFriendRequests {
    userFriendRequests() {
      id
      username
      avatarUrl
      gentlemanPercent
    }
  }
""";
