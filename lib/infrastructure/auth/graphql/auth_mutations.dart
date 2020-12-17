const String authRegisterDevice = """
mutation authRegisterDevice(\$platform: String!, \$token: String!, \$identifier: String!) {
  authRegisterDevice(platform: \$platform, token: \$token, identifier: \$identifier)
}
""";

const String registerAsPersonalMutation = """
  mutation registerAsPersonal(\$personalRegistrationInput: PersonalRegistrationInput!) {
    registerAsPersonal(personalRegistrationInput: \$personalRegistrationInput) {
      status
    }
  }
""";

const String registerAsTherapistMutation = """
  mutation registerAsTherapist(\$restorerRegistrationInput: TherapistRegistrationInput!) {
    registerAsTherapist(restorerRegistrationInput: \$restorerRegistrationInput) {
      id
    }
  }
""";

const String validateEmailMutation = """
  mutation validateEmail(\$emailCode: String!) {
    validateEmail(emailCode: \$emailCode) {
      status
    }
  }
""";

const String sendBackEmailMutation = """
  mutation sendBackEmail {
    sendBackEmail {
      status
    }
  }
""";
