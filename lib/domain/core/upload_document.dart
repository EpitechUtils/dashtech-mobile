import 'dart:io';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'upload_document.freezed.dart';

@freezed
abstract class UploadDocument implements _$UploadDocument {
  const factory UploadDocument({
    @required String id,
    @required File file,
  }) = _UploadDocument;

  const UploadDocument._();
}
