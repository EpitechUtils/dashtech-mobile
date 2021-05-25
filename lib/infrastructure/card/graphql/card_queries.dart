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

const String cardGetFilterValues = """
  query cardGetFilterValues(\$details: FilterDetailsInput!) {
    cardGetFilterValues(details: \$details) {
      filterType
      years {
        students
        scolaryear
      }
      courses {
        code
        old_title
        shortcode_school
        students
        title
      }
      promos {
        code
        old_title
        shortcode_school
        students
        title
      }
    }
  }
""";
