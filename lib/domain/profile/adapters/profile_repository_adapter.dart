import 'package:dartz/dartz.dart';
import 'package:dashtech/domain/core/failures/base_failure.dart';
import 'package:dashtech/infrastructure/core/graphql/graphql_api.dart';

abstract class IProfileRepository {
  Future<Either<BaseFailure, List<SettingsGetAll$Query$SettingEntity>>>
      getSettings();

  Future<Either<BaseFailure, List<SettingsUpdate$Mutation$SettingEntity>>>
      updateSettings(
    List<SettingUpdateInput> settings,
  );
}
