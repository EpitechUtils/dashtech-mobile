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

const String cardUpdateForLogin = """
  query cardUpdateForLogin(\$email: String!, \$nfcTag: String!) {
    cardUpdateForLogin(email: \$email, nfcTag: \$nfcTag) {
      id
      nfcTag
    }
  }
""";
