import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:dashtech/domain/core/failures/base_failure.dart';
import 'package:dashtech/domain/profile/adapters/profile_repository_adapter.dart';
import 'package:dashtech/infrastructure/core/graphql/graphql_api.dart';
import 'package:dashtech/infrastructure/core/service/graphql_service.dart';
import 'package:dashtech/infrastructure/core/service/storage_service.dart';
import 'package:get/get.dart';

class ProfileRepository implements IProfileRepository {
  final GraphqlService graphqlService = Get.find();
  final StorageService storageService = Get.find();

  @override
  Future<Either<BaseFailure, List<SettingsGetAll$Query$SettingEntity>>>
      getSettings() async {
    final response = await graphqlService.client.execute(SettingsGetAllQuery());
    if (response.hasErrors) {
      return left(const BaseFailure.unexpected());
    }
    return right(response.data!.settingsGetAll);
  }

  @override
  Future<Either<BaseFailure, List<SettingsUpdate$Mutation$SettingEntity>>>
      updateSettings(
    List<SettingUpdateInput> settings,
  ) async {
    final response = await graphqlService.client.execute(
      SettingsUpdateMutation(
        variables: SettingsUpdateArguments(
          settings: settings,
        ),
      ),
    );

    if (response.hasErrors) {
      return left(const BaseFailure.unexpected());
    }
    return right(response.data!.settingsUpdate);
  }
}
