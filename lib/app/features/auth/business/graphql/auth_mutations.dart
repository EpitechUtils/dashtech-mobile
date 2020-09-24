final String signinMutation = """
  mutation signinMutation(\$username: String!, \$password: String!) {
    authLogin(username: \$username, password: \$password) {
       csrf
       jwtToken
       profile {
        id
        username
        firstName
        lastName
        email
        gender
        birthDate
        credits
        gentlemanPercent
        avatarUrl
        address {
          id
          city
          address1
          address2
          postalCode
        }
       }
    }
  }
""";

final String signupMutation = """
  mutation signupMutation(\$username: String!, \$firstName: String!, \$lastName: String!, \$email: String!, \$password: String!, \$gender: String!, \$birthDate: String!) {
    authRegister(username: \$username, firstName: \$firstName, lastName: \$lastName, email: \$email, password: \$password, gender: \$gender, birthDate: \$birthDate) {
      csrf
      jwtToken
      profile {
        id
        username
        firstName
        lastName
        email
        gender
        birthDate
        credits
        gentlemanPercent
        avatarUrl
        address {
          id
          city
          address1
          address2
          postalCode
        }
       }
    }
  }
""";

final String forgotPasswordMutation = """
  mutation forgotPasswordMutation(\$email: String!) {
    authForgotPassword(email: \$email)
  }
""";

final String updatePasswordByCodeMutation = """
  mutation updatePasswordByCodeMutation(\$passwordWithCodeInput: PasswordWithCodeInput!) {
    authUpdatePasswordByCode(passwordWithCodeInput: \$passwordWithCodeInput)
  }
""";
