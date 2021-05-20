import 'package:freezed_annotation/freezed_annotation.dart';

part 'base_failure.freezed.dart';

@freezed
class BaseFailure with _$BaseFailure {
  const factory BaseFailure.unexpected({String? message}) = _Unexpected;
  const factory BaseFailure.notFound({String? message}) = _NotFound;
  const factory BaseFailure.conflict({String? message}) = _Conflict;
  const factory BaseFailure.unauthorized({String? message}) = _Unauthorized;
}
