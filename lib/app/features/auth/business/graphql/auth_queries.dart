final String authGetProfiles = """
  query authGetProfiles(\$deviceIdentifier: String!) {
    authGetProfiles(deviceIdentifier: \$deviceIdentifier) {
      id
      profileName
      deviceIdentifier
      autologUrl
    }
  }
""";

final String logoutQuery = """
  query logoutQuery(\$deviceIdentifier: String!) {
    authLogout(deviceIdentifier: \$deviceIdentifier)
  }
""";
