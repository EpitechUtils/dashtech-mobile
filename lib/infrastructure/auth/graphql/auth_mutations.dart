const String authRegisterDeviceMutation = """
mutation authRegisterDevice(\$platform: String!, \$token: String!, \$identifier: String!) {
  authRegisterDevice(platform: \$platform, token: \$token, identifier: \$identifier)
}
""";

const String authSendEmailConfirmationQuery = """
query authSendEmailConfirmation(\$email: String!) {
  authSendEmailConfirmation(email: \$email)
}
""";

const String authConfirmEmailCodeQuery = """
query authConfirmEmailCode(\$email: String!, \$code: String!) {
  authConfirmEmailCode(email: \$email, code: \$code) {
    id
    status
    email
  }
}
""";

const String profileSetAutologMutation = """
mutation profileSetAutolog(\$profileId: String!, \$autologUrl: String!) {
  profileSetAutolog(profileId: \$profileId, autologUrl: \$autologUrl)
}
""";

const String loginQuery = """
query login(\$profileId: String!, \$email: String!) {
  login(profileId: \$profileId, email: \$email) {
    accessToken
    expirationDate
  }
}
""";
