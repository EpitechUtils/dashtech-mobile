import 'package:freezed_annotation/freezed_annotation.dart';

part 'jwt_payload_dto.freezed.dart';
part 'jwt_payload_dto.g.dart';

@freezed
class JwtPayloadDto with _$JwtPayloadDto {
  const factory JwtPayloadDto({
    required String userId,
    required String email,
  }) = _JwtPayloadDto;

  factory JwtPayloadDto.fromJson(Map<String, dynamic> json) =>
      _$JwtPayloadDtoFromJson(json);

  const JwtPayloadDto._();
}
