import 'package:flutter_file_store/domain/restorer/models/restorer.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:meta/meta.dart';

part 'restorer_dto.freezed.dart';
part 'restorer_dto.g.dart';

@freezed
abstract class RestorerDto implements _$RestorerDto {
  const factory RestorerDto({
    @required String id,
  }) = _RestorerDto;

  factory RestorerDto.fromJson(Map<String, dynamic> json) =>
      _$RestorerDtoFromJson(json);

  const RestorerDto._();

  Restorer toDomain() {
    return Restorer(
      id: id,
    );
  }
}
