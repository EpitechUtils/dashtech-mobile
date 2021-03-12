const String settingsUpdateMutation = """
mutation settingsUpdate(\$settings: [SettingInput!]!) {
  settingsUpdate(settings: \$settings) {
    id
    setting
    value
  }
}
""";
