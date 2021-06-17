import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_profile.freezed.dart';
part 'auth_profile.g.dart';

@freezed
class AuthProfile with _$AuthProfile {
  const factory AuthProfile({
    required String id,
    required String email,
    required String status,
    @Default([]) List<String> rights,
  }) = _AuthProfile;

  factory AuthProfile.fromJson(Map<String, dynamic> json) => _$AuthProfileFromJson(json);

  const AuthProfile._();
}
