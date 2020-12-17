// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'upload_document.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
class _$UploadDocumentTearOff {
  const _$UploadDocumentTearOff();

// ignore: unused_element
  _UploadDocument call({@required String id, @required File file}) {
    return _UploadDocument(
      id: id,
      file: file,
    );
  }
}

/// @nodoc
// ignore: unused_element
const $UploadDocument = _$UploadDocumentTearOff();

/// @nodoc
mixin _$UploadDocument {
  String get id;
  File get file;

  $UploadDocumentCopyWith<UploadDocument> get copyWith;
}

/// @nodoc
abstract class $UploadDocumentCopyWith<$Res> {
  factory $UploadDocumentCopyWith(
          UploadDocument value, $Res Function(UploadDocument) then) =
      _$UploadDocumentCopyWithImpl<$Res>;
  $Res call({String id, File file});
}

/// @nodoc
class _$UploadDocumentCopyWithImpl<$Res>
    implements $UploadDocumentCopyWith<$Res> {
  _$UploadDocumentCopyWithImpl(this._value, this._then);

  final UploadDocument _value;
  // ignore: unused_field
  final $Res Function(UploadDocument) _then;

  @override
  $Res call({
    Object id = freezed,
    Object file = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed ? _value.id : id as String,
      file: file == freezed ? _value.file : file as File,
    ));
  }
}

/// @nodoc
abstract class _$UploadDocumentCopyWith<$Res>
    implements $UploadDocumentCopyWith<$Res> {
  factory _$UploadDocumentCopyWith(
          _UploadDocument value, $Res Function(_UploadDocument) then) =
      __$UploadDocumentCopyWithImpl<$Res>;
  @override
  $Res call({String id, File file});
}

/// @nodoc
class __$UploadDocumentCopyWithImpl<$Res>
    extends _$UploadDocumentCopyWithImpl<$Res>
    implements _$UploadDocumentCopyWith<$Res> {
  __$UploadDocumentCopyWithImpl(
      _UploadDocument _value, $Res Function(_UploadDocument) _then)
      : super(_value, (v) => _then(v as _UploadDocument));

  @override
  _UploadDocument get _value => super._value as _UploadDocument;

  @override
  $Res call({
    Object id = freezed,
    Object file = freezed,
  }) {
    return _then(_UploadDocument(
      id: id == freezed ? _value.id : id as String,
      file: file == freezed ? _value.file : file as File,
    ));
  }
}

/// @nodoc
class _$_UploadDocument extends _UploadDocument {
  const _$_UploadDocument({@required this.id, @required this.file})
      : assert(id != null),
        assert(file != null),
        super._();

  @override
  final String id;
  @override
  final File file;

  @override
  String toString() {
    return 'UploadDocument(id: $id, file: $file)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _UploadDocument &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.file, file) ||
                const DeepCollectionEquality().equals(other.file, file)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(file);

  @override
  _$UploadDocumentCopyWith<_UploadDocument> get copyWith =>
      __$UploadDocumentCopyWithImpl<_UploadDocument>(this, _$identity);
}

abstract class _UploadDocument extends UploadDocument {
  const _UploadDocument._() : super._();
  const factory _UploadDocument({@required String id, @required File file}) =
      _$_UploadDocument;

  @override
  String get id;
  @override
  File get file;
  @override
  _$UploadDocumentCopyWith<_UploadDocument> get copyWith;
}
