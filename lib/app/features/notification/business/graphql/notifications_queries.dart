final String notificationsAll = """
  query notificationsAll {
    notificationsAll {
    title
    user {
      title
      picture
      url
    }
    content
    date
    id
    visible
    class
  }
  }
""";
