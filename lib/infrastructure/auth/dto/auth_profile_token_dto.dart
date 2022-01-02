import 'package:dashtech/domain/auth/models/auth_profile.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

part 'auth_profile_token_dto.freezed.dart';
part 'auth_profile_token_dto.g.dart';

@freezed
class AuthProfileTokenDto with _$AuthProfileTokenDto {
  const factory AuthProfileTokenDto({
    required DateTime expirationTime,
    required String accessToken,
    required DateTime refreshExpirationTime,
    required String refreshToken,
  }) = _AuthProfileTokenDto;

  factory AuthProfileTokenDto.fromJson(Map<String, dynamic> json) =>
      _$AuthProfileTokenDtoFromJson(json);

  const AuthProfileTokenDto._();

  AuthProfile toDomain() {
    final Map<String, dynamic> decodedToken = JwtDecoder.decode(accessToken);
    return AuthProfile(
      id: decodedToken['userId'] as String,
      email: decodedToken['email'] as String,
      status: "valid",
    );
  }
}
