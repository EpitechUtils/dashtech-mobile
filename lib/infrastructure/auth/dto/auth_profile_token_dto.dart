import 'package:flutter_file_store/domain/auth/models/auth_profile.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:meta/meta.dart';

part 'auth_profile_token_dto.freezed.dart';
part 'auth_profile_token_dto.g.dart';

@freezed
abstract class AuthProfileTokenDto implements _$AuthProfileTokenDto {
  const factory AuthProfileTokenDto({
    @required DateTime expirationTime,
    @required String accessToken,
  }) = _AuthProfileTokenDto;

  factory AuthProfileTokenDto.fromJson(Map<String, dynamic> json) =>
      _$AuthProfileTokenDtoFromJson(json);

  const AuthProfileTokenDto._();

  AuthProfile toDomain() {
    final Map<String, dynamic> decodedToken = JwtDecoder.decode(accessToken);
    return AuthProfile(
        id: decodedToken['profileId'] as String,
        email: decodedToken['email'] as String,
        status: "login_in");
  }
}
