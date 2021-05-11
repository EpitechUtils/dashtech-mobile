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
