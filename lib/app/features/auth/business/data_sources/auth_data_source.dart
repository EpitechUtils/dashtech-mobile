import 'package:flutter/cupertino.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:epitech_intranet_mobile/app/core/error/exceptions.dart';
import 'package:epitech_intranet_mobile/app/features/auth/business/graphql/auth_mutations.dart';
import 'package:epitech_intranet_mobile/app/features/auth/business/graphql/auth_queries.dart';
import 'package:epitech_intranet_mobile/app/features/auth/business/use_cases/signin_usecase.dart';
import 'package:epitech_intranet_mobile/app/features/auth/business/use_cases/signup_usecase.dart';
import 'package:epitech_intranet_mobile/app/features/auth/models/auth_profile_model.dart';

@injectable
@lazySingleton
class AuthDataSource {
  final GraphQLClient client;

  AuthDataSource({@required this.client}) : assert(client != null);

  /// Create account
  Future<AuthProfileModel> signup(UserRegister userRegister) async {
    final QueryResult result = await client.mutate(MutationOptions(
      documentNode: gql(signupMutation),
      variables: {
        'username': userRegister.username,
        'lastName': userRegister.lastName,
        'firstName': userRegister.firstName,
        'email': userRegister.email,
        'password': userRegister.password,
        'gender': userRegister.gender,
        'birthDate': userRegister.birthDate,
      },
    ));
    if (result.hasException) {
      manageError(result);
    }
    return AuthProfileModel.fromJson(result.data['authRegister']);
  }

  /// Login into application
  Future<AuthProfileModel> signin(Credentials credentials) async {
    final QueryResult result = await client.mutate(MutationOptions(
      documentNode: gql(signinMutation),
      variables: {
        'username': credentials.username,
        'password': credentials.password,
      },
    ));
    if (result.hasException) {
      manageError(result);
    }
    return AuthProfileModel.fromJson(result.data['authLogin']);
  }

  /// Logout user
  Future<bool> logoutUser(String deviceIdentifier) async {
    final QueryResult result = await client.query(
      QueryOptions(
        documentNode: gql(logoutQuery),
        variables: {
          'deviceIdentifier': deviceIdentifier,
        },
      ),
    );
    if (result.hasException) {
      manageError(result);
    }
    return result.data['authLogout'];
  }
}
