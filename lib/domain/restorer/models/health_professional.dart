import 'package:freezed_annotation/freezed_annotation.dart';

part 'health_professional.freezed.dart';

@freezed
abstract class HealthProfessional implements _$HealthProfessional {
  const factory HealthProfessional({
    @required String firstName,
    @required String lastName,
    @required String job,
  }) = _HealthProfessional;

  const HealthProfessional._();

  String get info => '$firstName $lastName ($job)';
}
