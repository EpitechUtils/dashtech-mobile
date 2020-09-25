import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:epitech_intranet_mobile/app/core/error/exceptions.dart';
import 'package:epitech_intranet_mobile/app/features/profile/business/graphql/profile_mutations.dart';
import 'package:epitech_intranet_mobile/app/features/profile/business/graphql/profile_queries.dart';
import 'package:epitech_intranet_mobile/app/features/profile/business/graphql/register_device_mutations.dart';
import 'package:epitech_intranet_mobile/app/features/auth/models/profile_model.dart';
import 'package:epitech_intranet_mobile/app/core/utils/device_utils.dart';

@injectable
@lazySingleton
class ProfileDataSource {
  final GraphQLClient client;

  ProfileDataSource({@required this.client}) : assert(client != null);

  /// Find user by their id
  Future<ProfileModel> findProfile() async {
    final QueryResult result = await client.query(QueryOptions(
      documentNode: gql(profileQuery),
    ));
    if (result.hasException) {
      manageError(result);
    }
    return ProfileModel.fromJson(result.data['userById']);
  }

  /// Delete user
  Future<bool> delete() async {
    final QueryResult result = await client.mutate(
      MutationOptions(documentNode: gql(deleteProfileMutation)),
    );
    if (result.hasException) {
      manageError(result);
    }
    return result.data['userDelete'];
  }

  /// Register new device
  Future<bool> registerNewDevice(String token) async {
    String identifier = (await DeviceUtils.getDeviceDetails())['identifier'];
    final QueryResult result = await client.mutate(
      MutationOptions(
        documentNode: gql(registerDeviceMutation),
        variables: {
          'platform': Platform.operatingSystem,
          'token': token,
          'deviceIdentifier': identifier,
        },
      ),
    );
    if (result.hasException) {
      manageError(result);
      print(result.exception.graphqlErrors.first.message);
    }
    return result.data['userRegisterDevice'] as bool;
  }
}
