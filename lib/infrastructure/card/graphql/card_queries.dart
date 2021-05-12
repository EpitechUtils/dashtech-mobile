const String cardGetUsersByFilters = """
  query cardGetUsersByFilters(\$input: PromoFetchInput!) {
    cardGetUsersByFilters(filters: \$input) {
      login
      title
      location
      picture
    }
  }
""";

const String cardInfoByLogin = """
  query cardInfoByLogin(\$email: String!) {
    cardInfoByLogin(email: \$email) {
      card {
        login
        nfcTag
      }
      history {
        createdAt
        eventType
        message
        profile {
          id
          email
        }
      }
    }
  }
""";
