import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:meta/meta.dart';

part 'auth_profile.freezed.dart';

@freezed
abstract class AuthProfile implements _$AuthProfile {
  const factory AuthProfile({
    @required String id,
    @required String email,
  }) = _AuthProfile;

  const AuthProfile._();
}
