import 'package:freezed_annotation/freezed_annotation.dart';

part 'email_verification_failure.freezed.dart';

@freezed
abstract class EmailVerificationFailure with _$EmailVerificationFailure {
  const factory EmailVerificationFailure.unexpected() = _Unexpected;
  const factory EmailVerificationFailure.unauthorized() = _Unauthorized;
  const factory EmailVerificationFailure.wrongCode() = _WrongCode;
}
