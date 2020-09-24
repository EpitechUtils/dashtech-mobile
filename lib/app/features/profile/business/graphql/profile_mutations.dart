final String updateProfileMutation = """
  mutation updateProfileMutation(\$profile: UserInput!){
      userSave(userInput: \$profile) {
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
""";

final String updatePasswordMutation = """
  mutation updatePasswordMutation(\$newPasswordInput: NewPasswordInput!) {
    userupdatePassword(newPasswordInput: \$newPasswordInput)
  }
""";

final String deleteProfileMutation = """
  mutation deleteUserMutation {
    userDelete
  }
""";
