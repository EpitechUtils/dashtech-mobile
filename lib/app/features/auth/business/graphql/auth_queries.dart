final String checkResetCodeQuery = """
  query checkResetCodeQuery(\$email: String!, \$code: String!) {
    authCheckResetCode(email: \$email, code: \$code)
  }
""";

final String logoutQuery = """
  query logoutQuery(\$deviceIdentifier: String!) {
    authLogout(deviceIdentifier: \$deviceIdentifier)
  }
""";
