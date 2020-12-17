import 'package:flutter_file_store/domain/restorer/models/document_kind.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:meta/meta.dart';

part 'requested_document.freezed.dart';

@freezed
abstract class RequestedDocument implements _$RequestedDocument {
  const factory RequestedDocument({
    @required String id,
    @required String documentKindId,
    @required String jobId,
    @required bool isMandatory,
    @required DocumentKind documentKind,
  }) = _RequestedDocument;

  const RequestedDocument._();
}
