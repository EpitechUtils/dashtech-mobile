import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:meta/meta.dart';

part 'document_kind.freezed.dart';

@freezed
abstract class DocumentKind implements _$DocumentKind {
  const factory DocumentKind({
    @required String id,
    @required String name,
  }) = _DocumentKind;

  const DocumentKind._();
}
