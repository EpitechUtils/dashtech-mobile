import 'dart:io';

import 'package:epitech_intranet_mobile/app/core/error/exceptions.dart';
import 'package:epitech_intranet_mobile/app/features/auth/business/graphql/auth_mutations.dart';
import 'package:epitech_intranet_mobile/app/features/auth/business/graphql/auth_queries.dart';
import 'package:epitech_intranet_mobile/app/features/auth/business/use_cases/signin_usecase.dart';
import 'package:epitech_intranet_mobile/app/features/auth/models/profile_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

@injectable
@lazySingleton
class AuthDataSource {
  final GraphQLClient client;

  AuthDataSource({@required this.client}) : assert(client != null);

  /// Login into application
  Future<ProfileModel> signin(Credentials credentials) async {
    final QueryResult result = await client.mutate(MutationOptions(
      documentNode: gql(authCreateProfile),
      variables: {
        'profileInput': {
          'deviceIdentifier': credentials.identifier,
          'profileName': credentials.profileName,
          'autologUrl': credentials.autologUrl,
        },
      },
    ));
    if (result.hasException) {
      manageError(result);
    }
    return ProfileModel.fromJson(result.data['authCreateProfile']);
  }

  Future<List<ProfileModel>> getRegisteredProfiles(String deviceIdentifier) async {
    final QueryResult result = await client.query(QueryOptions(
      documentNode: gql(authGetProfiles),
      variables: {'deviceIdentifier': deviceIdentifier},
    ));
    if (result.hasException) {
      manageError(result);
    }
    final json = result.data['authGetProfiles'] as List;
    return json.map((dynamic model) => ProfileModel.fromJson(model)).toList();
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

  /// Register new device
  Future<bool> registerNewDevice(Map<String, String> data) async {
    final QueryResult result = await client.mutate(
      MutationOptions(
        documentNode: gql(authRegisterDevice),
        variables: {
          'platform': Platform.operatingSystem,
          'token': data['token'],
          'deviceUuid': data['deviceUuid'],
        },
      ),
    );
    if (result.hasException) {
      manageError(result);
    }
    return result.data['userRegisterDevice'] as bool;
  }
}
