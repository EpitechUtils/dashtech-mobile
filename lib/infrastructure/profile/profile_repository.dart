import 'package:dartz/dartz.dart';
import 'package:dashtech/domain/core/failures/base_failure.dart';
import 'package:dashtech/domain/profile/adapters/profile_repository_adapter.dart';
import 'package:dashtech/domain/profile/models/profile_setting.dart';
import 'package:dashtech/infrastructure/core/service/graphql_service.dart';
import 'package:dashtech/infrastructure/core/storage_service.dart';
import 'package:dashtech/infrastructure/profile/graphql/profile_mutations.dart';
import 'package:dashtech/infrastructure/profile/graphql/profile_queries.dart';
import 'package:dashtech/infrastructure/profile/input/profile_setting_input.dart';
import 'package:get/get.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class ProfileRepository implements IProfileRepository {
  final GraphqlService graphqlService = Get.find();
  final StorageService storageService = Get.find();

  @override
  Future<Either<BaseFailure, List<ProfileSetting>>> getSettings() async {
    final QueryResult result = await graphqlService.client.query(
      QueryOptions(document: gql(settingsGetAllQuery)),
    );

    if (result.hasException) {
      return left(const BaseFailure.unexpected());
    }

    final List json = result.data!['settingsGetAll'] as List;
    return right(json.map((value) => ProfileSetting.fromJson(value)).toList());
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

    final List json = result.data!['settingsUpdate'] as List;
    return right(json.map((value) => ProfileSetting.fromJson(value)).toList());
  }
}
