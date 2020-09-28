final String settingsUpdate = """
  mutation settingsUpdate(\$setting: String!, \$value: String!) {
    settingsUpdate(setting: \$setting, value: \$value) {
      id
      setting
      value
    }
  }
""";
