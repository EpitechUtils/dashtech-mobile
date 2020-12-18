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

// fill on top of this

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
