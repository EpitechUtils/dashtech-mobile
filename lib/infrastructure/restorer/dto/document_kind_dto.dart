import 'package:flutter_file_store/domain/restorer/models/document_kind.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:meta/meta.dart';

part 'document_kind_dto.freezed.dart';
part 'document_kind_dto.g.dart';

@freezed
abstract class DocumentKindDto implements _$DocumentKindDto {
  const factory DocumentKindDto({
    @required String id,
    @required String name,
  }) = _DocumentKindDto;

  factory DocumentKindDto.fromJson(Map<String, dynamic> json) =>
      _$DocumentKindDtoFromJson(json);

  const DocumentKindDto._();

  DocumentKind toDomain() {
    return DocumentKind(
      id: id,
      name: name,
    );
  }
}
