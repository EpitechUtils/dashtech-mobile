import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:meta/meta.dart';

part 'credentials.freezed.dart';

@freezed
abstract class Credentials with _$Credentials {
  const factory Credentials({
    @required String email,
    @required String password,
  }) = _Credentials;
}
