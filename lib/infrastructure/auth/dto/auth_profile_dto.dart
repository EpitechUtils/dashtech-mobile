import 'package:flutter_file_store/domain/auth/models/auth_profile.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:meta/meta.dart';

part 'auth_profile_dto.freezed.dart';
part 'auth_profile_dto.g.dart';

@freezed
abstract class AuthProfileDto implements _$AuthProfileDto {
  const factory AuthProfileDto({
    @required DateTime expirationTime,
    @required String accessToken,
  }) = _AuthProfileDto;

  factory AuthProfileDto.fromJson(Map<String, dynamic> json) =>
      _$AuthProfileDtoFromJson(json);

  const AuthProfileDto._();

  AuthProfile toDomain() {
    final Map<String, dynamic> decodedToken = JwtDecoder.decode(accessToken);
    return AuthProfile(
      id: decodedToken['userId'] as String,
      email: decodedToken['email'] as String,
    );
  }
}
