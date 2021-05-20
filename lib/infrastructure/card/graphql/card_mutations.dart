const String cardUpdateForLogin = """
  mutation cardUpdateForLogin(\$email: String!, \$nfcTag: String!) {
    cardUpdateForLogin(email: \$email, nfcTag: \$nfcTag) {
      id
      nfcTag
    }
  }
""";

const String cardRemove = """
  mutation cardRemove(\$email: String!) {
    cardRemove(email: \$email)
  }
""";
