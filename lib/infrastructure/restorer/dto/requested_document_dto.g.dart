// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'requested_document_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_RequestedDocumentDto _$_$_RequestedDocumentDtoFromJson(
    Map<String, dynamic> json) {
  return _$_RequestedDocumentDto(
    id: json['id'] as String,
    documentKindId: json['documentKindId'] as String,
    jobId: json['jobId'] as String,
    isMandatory: json['isMandatory'] as bool,
    documentKind: json['documentKind'] == null
        ? null
        : DocumentKindDto.fromJson(
            json['documentKind'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$_$_RequestedDocumentDtoToJson(
        _$_RequestedDocumentDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'documentKindId': instance.documentKindId,
      'jobId': instance.jobId,
      'isMandatory': instance.isMandatory,
      'documentKind': instance.documentKind,
    };
