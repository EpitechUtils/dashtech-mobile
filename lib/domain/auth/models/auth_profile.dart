import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:meta/meta.dart';

part 'auth_profile.freezed.dart';
part 'auth_profile.g.dart';

@freezed
abstract class AuthProfile implements _$AuthProfile {
  const factory AuthProfile({
    @required String id,
    @required String email,
    @required String status,
  }) = _AuthProfile;

  factory AuthProfile.fromJson(Map<String, dynamic> json) =>
      _$AuthProfileFromJson(json);

  const AuthProfile._();
}
