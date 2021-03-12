import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:dashtech/domain/auth/adapters/auth_repository_adapter.dart';
import 'package:dashtech/domain/auth/failures/auth_failure.dart';
import 'package:dashtech/domain/auth/models/auth_profile.dart';
import 'package:dashtech/domain/core/failures/base_failure.dart';
import 'package:dashtech/domain/profile/adapters/profile_repository_adapter.dart';
import 'package:dashtech/domain/profile/models/profile_setting.dart';
import 'package:dashtech/infrastructure/auth/dto/auth_profile_token_dto.dart';
import 'package:dashtech/infrastructure/auth/graphql/auth_mutations.dart';
import 'package:dashtech/infrastructure/auth/graphql/auth_queries.dart';
import 'package:dashtech/infrastructure/core/graphql_service.dart';
import 'package:dashtech/infrastructure/core/storage_service.dart';
import 'package:dashtech/infrastructure/core/token_service.dart';
import 'package:dashtech/infrastructure/profile/dto/profile_setting_dto.dart';
import 'package:dashtech/infrastructure/profile/graphql/profile_mutations.dart';
import 'package:dashtech/infrastructure/profile/graphql/profile_queries.dart';
import 'package:dashtech/infrastructure/profile/input/profile_setting_input.dart';
import 'package:flutter/cupertino.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

class ProfileRepository implements IProfileRepository {
  ProfileRepository({
    @required this.graphqlService,
    @required this.storageService,
  })  : assert(graphqlService != null),
        assert(storageService != null);

  GraphqlService graphqlService;
  StorageService storageService;

  @override
  Future<Either<BaseFailure, List<ProfileSetting>>> getSettings() async {
    final QueryResult result = await graphqlService.client.query(
      QueryOptions(document: gql(settingsGetAllQuery)),
    );

    if (result.hasException) {
      return left(const BaseFailure.unexpected());
    }

    final List json = result.data['settingsGetAll'] as List;
    return right(json
        .map((value) => ProfileSettingDto.fromJson(value).toDomain())
        .toList());
  }

  @override
  Future<Either<BaseFailure, List<ProfileSetting>>> updateSettings(
    List<ProfileSettingInput> settings,
  ) async {
    final QueryResult result = await graphqlService.client.query(
      QueryOptions(
        document: gql(settingsUpdateMutation),
        variables: {'settings': settings},
      ),
    );

    if (result.hasException) {
      return left(const BaseFailure.unexpected());
    }

    final List json = result.data['settingsUpdate'] as List;
    return right(json
        .map((value) => ProfileSettingDto.fromJson(value).toDomain())
        .toList());
  }
}
