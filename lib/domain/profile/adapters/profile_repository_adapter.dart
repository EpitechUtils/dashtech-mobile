import 'package:dartz/dartz.dart';
import 'package:dashtech/domain/core/failures/base_failure.dart';
import 'package:dashtech/domain/profile/models/profile_setting.dart';
import 'package:dashtech/infrastructure/profile/input/profile_setting_input.dart';

abstract class IProfileRepository {
  Future<Either<BaseFailure, List<ProfileSetting>>> getSettings();
  Future<Either<BaseFailure, List<ProfileSetting>>> updateSettings(
      List<ProfileSettingInput> settings);
}
