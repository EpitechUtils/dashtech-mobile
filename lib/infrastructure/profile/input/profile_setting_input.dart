import 'package:freezed_annotation/freezed_annotation.dart';

part 'profile_setting_input.freezed.dart';
part 'profile_setting_input.g.dart';

@freezed
class ProfileSettingInput with _$ProfileSettingInput {
  const factory ProfileSettingInput({
    required String setting,
    required String value,
  }) = _ProfileSettingInput;

  factory ProfileSettingInput.fromJson(Map<String, dynamic> json) =>
      _$ProfileSettingInputFromJson(json);

  const ProfileSettingInput._();
}
