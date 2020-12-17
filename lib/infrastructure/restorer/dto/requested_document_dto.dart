import 'package:flutter_file_store/domain/restorer/models/requested_document.dart';
import 'package:flutter_file_store/infrastructure/restorer/dto/document_kind_dto.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:meta/meta.dart';

part 'requested_document_dto.freezed.dart';
part 'requested_document_dto.g.dart';

@freezed
abstract class RequestedDocumentDto implements _$RequestedDocumentDto {
  const factory RequestedDocumentDto({
    @required String id,
    @required String documentKindId,
    @required String jobId,
    @required bool isMandatory,
    @required DocumentKindDto documentKind,
  }) = _RequestedDocumentDto;

  const RequestedDocumentDto._();

  factory RequestedDocumentDto.fromJson(Map<String, dynamic> json) =>
      _$RequestedDocumentDtoFromJson(json);

  RequestedDocument toDomain() {
    return RequestedDocument(
      id: id,
      documentKindId: documentKindId,
      jobId: jobId,
      isMandatory: isMandatory,
      documentKind: documentKind.toDomain(),
    );
  }
}
