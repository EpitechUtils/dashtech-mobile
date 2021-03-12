import 'package:dashtech/domain/auth/models/auth_profile.dart';
import 'package:dashtech/domain/profile/models/profile_setting.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:meta/meta.dart';

part 'profile_setting_dto.freezed.dart';
part 'profile_setting_dto.g.dart';

@freezed
abstract class ProfileSettingDto implements _$ProfileSettingDto {
  const factory ProfileSettingDto({
    @required String id,
    @required String setting,
    @required String value,
  }) = _ProfileSettingDto;

  factory ProfileSettingDto.fromJson(Map<String, dynamic> json) =>
      _$ProfileSettingDtoFromJson(json);

  const ProfileSettingDto._();

  ProfileSetting toDomain() {
    return ProfileSetting(
      id: id,
      setting: setting,
      value: value,
    );
  }
}
