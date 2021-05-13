const String cardGetUsersByFilters = """
  query cardGetUsersByFilters(\$input: PromoFetchInput!) {
    cardGetUsersByFilters(filters: \$input) {
      login
      title
      location
      picture
      card {
        id
        nfcTag
      }
    }
  }
""";

const String cardHistoryByLogin = """
  query cardHistoryByLogin(\$email: String!) {
    cardHistoryByLogin(email: \$email) {
      createdAt
      eventType
      message
      profile {
        id
        email
      }
    }
  }
""";
