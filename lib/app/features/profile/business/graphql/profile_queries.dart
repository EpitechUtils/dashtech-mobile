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

final String authGetAutolog = """
  query authGetAutolog {
    authGetAutolog
  }
""";
