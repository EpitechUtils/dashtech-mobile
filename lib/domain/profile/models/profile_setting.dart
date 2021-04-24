import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:meta/meta.dart';

part 'profile_setting.freezed.dart';
part 'profile_setting.g.dart';

@freezed
class ProfileSetting with _$ProfileSetting {
  const factory ProfileSetting({
    required String id,
    required String setting,
    required String value,
  }) = _ProfileSetting;

  factory ProfileSetting.fromJson(Map<String, dynamic> json) =>
      _$ProfileSettingFromJson(json);

  const ProfileSetting._();
}
