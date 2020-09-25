final String authCreateProfile = """
  mutation authCreateProfile(\$profileInput: NewProfileInput!) {
    authCreateProfile(profileInput: \$profileInput) {
      id
      profileName
      deviceIdentifier
      autologUrl
    }
  }
""";
