import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_failure.freezed.dart';

@freezed
abstract class AuthFailure with _$AuthFailure {
  const factory AuthFailure.unexpected() = _Unexpected;
  const factory AuthFailure.profileNotFound() = _ProfileNotFound;
  const factory AuthFailure.invalidCode() = _InvalidCode;
  const factory AuthFailure.expiredCode() = _ExpiredCode;
}
