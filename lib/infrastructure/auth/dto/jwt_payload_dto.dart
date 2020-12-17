import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:meta/meta.dart';

part 'jwt_payload_dto.freezed.dart';
part 'jwt_payload_dto.g.dart';

@freezed
abstract class JwtPayloadDto implements _$JwtPayloadDto {
  const factory JwtPayloadDto({
    @required String userId,
    @required String email,
  }) = _JwtPayloadDto;

  factory JwtPayloadDto.fromJson(Map<String, dynamic> json) =>
      _$JwtPayloadDtoFromJson(json);

  const JwtPayloadDto._();
}
