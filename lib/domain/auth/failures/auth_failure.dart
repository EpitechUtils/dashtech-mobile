import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_failure.freezed.dart';

@freezed
class AuthFailure with _$AuthFailure {
  const factory AuthFailure.unexpected() = _Unexpected;
  const factory AuthFailure.notFound() = _NotFound;
  const factory AuthFailure.conflict() = _Conflict;
  const factory AuthFailure.unauthorized() = _Unauthorized;
}
