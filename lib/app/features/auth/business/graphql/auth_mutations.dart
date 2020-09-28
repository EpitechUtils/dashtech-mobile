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

final String authRegisterDevice = """
mutation authRegisterDevice(\$platform: String!, \$token: String!, \$deviceUuid: String!) {
  authRegisterDevice(platform: \$platform, token: \$token, deviceUuid: \$deviceUuid)
}
""";
