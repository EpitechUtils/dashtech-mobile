import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_failure.freezed.dart';

@freezed
abstract class AuthFailure with _$AuthFailure {
  const factory AuthFailure.unexpected() = _Unexpected;
  const factory AuthFailure.unauthorized() = _Unauthorized;
  const factory AuthFailure.alreadyExist() = _AlreadyExist;
  const factory AuthFailure.domainUnauthorized() = _DomainUnauthorized;
}
