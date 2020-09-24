final String registerDeviceMutation = """
mutation registerDevice(\$platform: String!, \$token: String!, \$deviceIdentifier: String!) {
  userRegisterDevice(platform: \$platform, token: \$token, deviceIdentifier: \$deviceIdentifier )
}
""";
