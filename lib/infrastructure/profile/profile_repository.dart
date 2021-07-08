import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:dashtech/domain/core/failures/base_failure.dart';
import 'package:dashtech/domain/profile/adapters/profile_repository_adapter.dart';
import 'package:dashtech/domain/profile/models/profile_setting.dart';
import 'package:dashtech/infrastructure/core/graphql/schema.schema.gql.dart';
import 'package:dashtech/infrastructure/core/service/graphql_service.dart';
import 'package:dashtech/infrastructure/core/service/storage_service.dart';
import 'package:dashtech/infrastructure/profile/graphql/mutation/settingsUpdate.data.gql.dart';
import 'package:dashtech/infrastructure/profile/graphql/mutation/settingsUpdate.req.gql.dart';
import 'package:dashtech/infrastructure/profile/graphql/query/settingsGetAll.data.gql.dart';
import 'package:dashtech/infrastructure/profile/graphql/query/settingsGetAll.req.gql.dart';
import 'package:get/get.dart';

class ProfileRepository implements IProfileRepository {
  final GraphqlService graphqlService = Get.find();
  final StorageService storageService = Get.find();

  @override
  Future<Either<BaseFailure, List<GSettingsGetAllData_settingsGetAll>>> getSettings() async {
    final completer = Completer<Either<BaseFailure, List<GSettingsGetAllData_settingsGetAll>>>();
    final request = GSettingsGetAllReq((b) => b);

    graphqlService.client.request(request).listen((response) {
      if (response.loading) return;
      if (response.hasErrors) {
        completer.complete(left(const BaseFailure.unexpected()));
        return;
      }
      completer.complete(right(response.data!.settingsGetAll.toList()));
    });

    return completer.future;
  }

  @override
  Future<Either<BaseFailure, List<GSettingsUpdateData_settingsUpdate>>> updateSettings(
    List<GSettingInput> settings,
  ) async {
    final completer = Completer<Either<BaseFailure, List<GSettingsUpdateData_settingsUpdate>>>();
    final request = GSettingsUpdateReq((b) => b..vars.settings.addAll(settings));

    graphqlService.client.request(request).listen((response) {
      if (response.loading) return;
      if (response.hasErrors) {
        completer.complete(left(const BaseFailure.unexpected()));
        return;
      }
      completer.complete(right(response.data!.settingsUpdate.toList()));
    });

    return completer.future;
  }
}
