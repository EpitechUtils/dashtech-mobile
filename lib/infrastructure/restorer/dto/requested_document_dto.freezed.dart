// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'requested_document_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;
RequestedDocumentDto _$RequestedDocumentDtoFromJson(Map<String, dynamic> json) {
  return _RequestedDocumentDto.fromJson(json);
}

/// @nodoc
class _$RequestedDocumentDtoTearOff {
  const _$RequestedDocumentDtoTearOff();

// ignore: unused_element
  _RequestedDocumentDto call(
      {@required String id,
      @required String documentKindId,
      @required String jobId,
      @required bool isMandatory,
      @required DocumentKindDto documentKind}) {
    return _RequestedDocumentDto(
      id: id,
      documentKindId: documentKindId,
      jobId: jobId,
      isMandatory: isMandatory,
      documentKind: documentKind,
    );
  }

// ignore: unused_element
  RequestedDocumentDto fromJson(Map<String, Object> json) {
    return RequestedDocumentDto.fromJson(json);
  }
}

/// @nodoc
// ignore: unused_element
const $RequestedDocumentDto = _$RequestedDocumentDtoTearOff();

/// @nodoc
mixin _$RequestedDocumentDto {
  String get id;
  String get documentKindId;
  String get jobId;
  bool get isMandatory;
  DocumentKindDto get documentKind;

  Map<String, dynamic> toJson();
  $RequestedDocumentDtoCopyWith<RequestedDocumentDto> get copyWith;
}

/// @nodoc
abstract class $RequestedDocumentDtoCopyWith<$Res> {
  factory $RequestedDocumentDtoCopyWith(RequestedDocumentDto value,
          $Res Function(RequestedDocumentDto) then) =
      _$RequestedDocumentDtoCopyWithImpl<$Res>;
  $Res call(
      {String id,
      String documentKindId,
      String jobId,
      bool isMandatory,
      DocumentKindDto documentKind});

  $DocumentKindDtoCopyWith<$Res> get documentKind;
}

/// @nodoc
class _$RequestedDocumentDtoCopyWithImpl<$Res>
    implements $RequestedDocumentDtoCopyWith<$Res> {
  _$RequestedDocumentDtoCopyWithImpl(this._value, this._then);

  final RequestedDocumentDto _value;
  // ignore: unused_field
  final $Res Function(RequestedDocumentDto) _then;

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
          : documentKind as DocumentKindDto,
    ));
  }

  @override
  $DocumentKindDtoCopyWith<$Res> get documentKind {
    if (_value.documentKind == null) {
      return null;
    }
    return $DocumentKindDtoCopyWith<$Res>(_value.documentKind, (value) {
      return _then(_value.copyWith(documentKind: value));
    });
  }
}

/// @nodoc
abstract class _$RequestedDocumentDtoCopyWith<$Res>
    implements $RequestedDocumentDtoCopyWith<$Res> {
  factory _$RequestedDocumentDtoCopyWith(_RequestedDocumentDto value,
          $Res Function(_RequestedDocumentDto) then) =
      __$RequestedDocumentDtoCopyWithImpl<$Res>;
  @override
  $Res call(
      {String id,
      String documentKindId,
      String jobId,
      bool isMandatory,
      DocumentKindDto documentKind});

  @override
  $DocumentKindDtoCopyWith<$Res> get documentKind;
}

/// @nodoc
class __$RequestedDocumentDtoCopyWithImpl<$Res>
    extends _$RequestedDocumentDtoCopyWithImpl<$Res>
    implements _$RequestedDocumentDtoCopyWith<$Res> {
  __$RequestedDocumentDtoCopyWithImpl(
      _RequestedDocumentDto _value, $Res Function(_RequestedDocumentDto) _then)
      : super(_value, (v) => _then(v as _RequestedDocumentDto));

  @override
  _RequestedDocumentDto get _value => super._value as _RequestedDocumentDto;

  @override
  $Res call({
    Object id = freezed,
    Object documentKindId = freezed,
    Object jobId = freezed,
    Object isMandatory = freezed,
    Object documentKind = freezed,
  }) {
    return _then(_RequestedDocumentDto(
      id: id == freezed ? _value.id : id as String,
      documentKindId: documentKindId == freezed
          ? _value.documentKindId
          : documentKindId as String,
      jobId: jobId == freezed ? _value.jobId : jobId as String,
      isMandatory:
          isMandatory == freezed ? _value.isMandatory : isMandatory as bool,
      documentKind: documentKind == freezed
          ? _value.documentKind
          : documentKind as DocumentKindDto,
    ));
  }
}

@JsonSerializable()

/// @nodoc
class _$_RequestedDocumentDto extends _RequestedDocumentDto {
  const _$_RequestedDocumentDto(
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

  factory _$_RequestedDocumentDto.fromJson(Map<String, dynamic> json) =>
      _$_$_RequestedDocumentDtoFromJson(json);

  @override
  final String id;
  @override
  final String documentKindId;
  @override
  final String jobId;
  @override
  final bool isMandatory;
  @override
  final DocumentKindDto documentKind;

  @override
  String toString() {
    return 'RequestedDocumentDto(id: $id, documentKindId: $documentKindId, jobId: $jobId, isMandatory: $isMandatory, documentKind: $documentKind)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _RequestedDocumentDto &&
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
  _$RequestedDocumentDtoCopyWith<_RequestedDocumentDto> get copyWith =>
      __$RequestedDocumentDtoCopyWithImpl<_RequestedDocumentDto>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_RequestedDocumentDtoToJson(this);
  }
}

abstract class _RequestedDocumentDto extends RequestedDocumentDto {
  const _RequestedDocumentDto._() : super._();
  const factory _RequestedDocumentDto(
      {@required String id,
      @required String documentKindId,
      @required String jobId,
      @required bool isMandatory,
      @required DocumentKindDto documentKind}) = _$_RequestedDocumentDto;

  factory _RequestedDocumentDto.fromJson(Map<String, dynamic> json) =
      _$_RequestedDocumentDto.fromJson;

  @override
  String get id;
  @override
  String get documentKindId;
  @override
  String get jobId;
  @override
  bool get isMandatory;
  @override
  DocumentKindDto get documentKind;
  @override
  _$RequestedDocumentDtoCopyWith<_RequestedDocumentDto> get copyWith;
}
