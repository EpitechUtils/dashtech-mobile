import 'package:dartz/dartz.dart';
import 'package:dashtech/domain/core/failures/base_failure.dart';
import 'package:dashtech/domain/profile/models/profile_setting.dart';
import 'package:dashtech/infrastructure/core/graphql/schema.schema.gql.dart';
import 'package:dashtech/infrastructure/profile/graphql/mutation/settingsUpdate.data.gql.dart';
import 'package:dashtech/infrastructure/profile/graphql/query/settingsGetAll.data.gql.dart';
import 'package:dashtech/infrastructure/profile/input/profile_setting_input.dart';

abstract class IProfileRepository {
  Future<Either<BaseFailure, List<GSettingsGetAllData_settingsGetAll>>> getSettings();
  Future<Either<BaseFailure, List<GSettingsUpdateData_settingsUpdate>>> updateSettings(
      List<GSettingInput> settings);
}
