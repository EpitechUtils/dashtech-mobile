// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'requested_document.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
class _$RequestedDocumentTearOff {
  const _$RequestedDocumentTearOff();

// ignore: unused_element
  _RequestedDocument call(
      {@required String id,
      @required String documentKindId,
      @required String jobId,
      @required bool isMandatory,
      @required DocumentKind documentKind}) {
    return _RequestedDocument(
      id: id,
      documentKindId: documentKindId,
      jobId: jobId,
      isMandatory: isMandatory,
      documentKind: documentKind,
    );
  }
}

/// @nodoc
// ignore: unused_element
const $RequestedDocument = _$RequestedDocumentTearOff();

/// @nodoc
mixin _$RequestedDocument {
  String get id;
  String get documentKindId;
  String get jobId;
  bool get isMandatory;
  DocumentKind get documentKind;

  $RequestedDocumentCopyWith<RequestedDocument> get copyWith;
}

/// @nodoc
abstract class $RequestedDocumentCopyWith<$Res> {
  factory $RequestedDocumentCopyWith(
          RequestedDocument value, $Res Function(RequestedDocument) then) =
      _$RequestedDocumentCopyWithImpl<$Res>;
  $Res call(
      {String id,
      String documentKindId,
      String jobId,
      bool isMandatory,
      DocumentKind documentKind});

  $DocumentKindCopyWith<$Res> get documentKind;
}

/// @nodoc
class _$RequestedDocumentCopyWithImpl<$Res>
    implements $RequestedDocumentCopyWith<$Res> {
  _$RequestedDocumentCopyWithImpl(this._value, this._then);

  final RequestedDocument _value;
  // ignore: unused_field
  final $Res Function(RequestedDocument) _then;

  @override
  $Res call({
    Object id = freezed,
    Object documentKindId = freezed,
    Object jobId = freezed,
    Object isMandatory = freezed,
    Object documentKind = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed ? _value.id : id as String,
      documentKindId: documentKindId == freezed
          ? _value.documentKindId
          : documentKindId as String,
      jobId: jobId == freezed ? _value.jobId : jobId as String,
      isMandatory:
          isMandatory == freezed ? _value.isMandatory : isMandatory as bool,
      documentKind: documentKind == freezed
          ? _value.documentKind
          : documentKind as DocumentKind,
    ));
  }

  @override
  $DocumentKindCopyWith<$Res> get documentKind {
    if (_value.documentKind == null) {
      return null;
    }
    return $DocumentKindCopyWith<$Res>(_value.documentKind, (value) {
      return _then(_value.copyWith(documentKind: value));
    });
  }
}

/// @nodoc
abstract class _$RequestedDocumentCopyWith<$Res>
    implements $RequestedDocumentCopyWith<$Res> {
  factory _$RequestedDocumentCopyWith(
          _RequestedDocument value, $Res Function(_RequestedDocument) then) =
      __$RequestedDocumentCopyWithImpl<$Res>;
  @override
  $Res call(
      {String id,
      String documentKindId,
      String jobId,
      bool isMandatory,
      DocumentKind documentKind});

  @override
  $DocumentKindCopyWith<$Res> get documentKind;
}

/// @nodoc
class __$RequestedDocumentCopyWithImpl<$Res>
    extends _$RequestedDocumentCopyWithImpl<$Res>
    implements _$RequestedDocumentCopyWith<$Res> {
  __$RequestedDocumentCopyWithImpl(
      _RequestedDocument _value, $Res Function(_RequestedDocument) _then)
      : super(_value, (v) => _then(v as _RequestedDocument));

  @override
  _RequestedDocument get _value => super._value as _RequestedDocument;

  @override
  $Res call({
    Object id = freezed,
    Object documentKindId = freezed,
    Object jobId = freezed,
    Object isMandatory = freezed,
    Object documentKind = freezed,
  }) {
    return _then(_RequestedDocument(
      id: id == freezed ? _value.id : id as String,
      documentKindId: documentKindId == freezed
          ? _value.documentKindId
          : documentKindId as String,
      jobId: jobId == freezed ? _value.jobId : jobId as String,
      isMandatory:
          isMandatory == freezed ? _value.isMandatory : isMandatory as bool,
      documentKind: documentKind == freezed
          ? _value.documentKind
          : documentKind as DocumentKind,
    ));
  }
}

/// @nodoc
class _$_RequestedDocument extends _RequestedDocument {
  const _$_RequestedDocument(
      {@required this.id,
      @required this.documentKindId,
      @required this.jobId,
      @required this.isMandatory,
      @required this.documentKind})
      : assert(id != null),
        assert(documentKindId != null),
        assert(jobId != null),
        assert(isMandatory != null),
        assert(documentKind != null),
        super._();

  @override
  final String id;
  @override
  final String documentKindId;
  @override
  final String jobId;
  @override
  final bool isMandatory;
  @override
  final DocumentKind documentKind;

  @override
  String toString() {
    return 'RequestedDocument(id: $id, documentKindId: $documentKindId, jobId: $jobId, isMandatory: $isMandatory, documentKind: $documentKind)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _RequestedDocument &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.documentKindId, documentKindId) ||
                const DeepCollectionEquality()
                    .equals(other.documentKindId, documentKindId)) &&
            (identical(other.jobId, jobId) ||
                const DeepCollectionEquality().equals(other.jobId, jobId)) &&
            (identical(other.isMandatory, isMandatory) ||
                const DeepCollectionEquality()
                    .equals(other.isMandatory, isMandatory)) &&
            (identical(other.documentKind, documentKind) ||
                const DeepCollectionEquality()
                    .equals(other.documentKind, documentKind)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(documentKindId) ^
      const DeepCollectionEquality().hash(jobId) ^
      const DeepCollectionEquality().hash(isMandatory) ^
      const DeepCollectionEquality().hash(documentKind);

  @override
  _$RequestedDocumentCopyWith<_RequestedDocument> get copyWith =>
      __$RequestedDocumentCopyWithImpl<_RequestedDocument>(this, _$identity);
}

abstract class _RequestedDocument extends RequestedDocument {
  const _RequestedDocument._() : super._();
  const factory _RequestedDocument(
      {@required String id,
      @required String documentKindId,
      @required String jobId,
      @required bool isMandatory,
      @required DocumentKind documentKind}) = _$_RequestedDocument;

  @override
  String get id;
  @override
  String get documentKindId;
  @override
  String get jobId;
  @override
  bool get isMandatory;
  @override
  DocumentKind get documentKind;
  @override
  _$RequestedDocumentCopyWith<_RequestedDocument> get copyWith;
}
