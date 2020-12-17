import 'package:freezed_annotation/freezed_annotation.dart';

part 'restorer_failure.freezed.dart';

@freezed
abstract class RestorerFailure with _$RestorerFailure {
  const factory RestorerFailure.unexpected() = _Unexpected;
}
