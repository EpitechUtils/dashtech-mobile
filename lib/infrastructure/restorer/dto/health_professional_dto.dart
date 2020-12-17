import 'package:flutter_file_store/domain/restorer/models/health_professional.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:meta/meta.dart';

part 'health_professional_dto.freezed.dart';
part 'health_professional_dto.g.dart';

@freezed
abstract class HealthProfessionalDto implements _$HealthProfessionalDto {
  const factory HealthProfessionalDto({
    @required String firstName,
    @required String lastName,
    @required String job,
  }) = _HealthProfessionalDto;

  factory HealthProfessionalDto.fromJson(Map<String, dynamic> json) =>
      _$HealthProfessionalDtoFromJson(json);

  const HealthProfessionalDto._();

  HealthProfessional toDomain() {
    return HealthProfessional(
      firstName: firstName,
      lastName: lastName,
      job: job,
    );
  }
}
