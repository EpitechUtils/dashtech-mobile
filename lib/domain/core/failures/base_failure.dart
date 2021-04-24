import 'package:freezed_annotation/freezed_annotation.dart';

part 'base_failure.freezed.dart';

@freezed
class BaseFailure with _$BaseFailure {
  const factory BaseFailure.unexpected() = _Unexpected;
  const factory BaseFailure.notFound() = _NotFound;
  const factory BaseFailure.conflict() = _Conflict;
  const factory BaseFailure.unauthorized() = _Unauthorized;
}
