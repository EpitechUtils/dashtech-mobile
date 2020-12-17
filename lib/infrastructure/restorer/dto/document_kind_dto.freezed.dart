// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'document_kind_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;
DocumentKindDto _$DocumentKindDtoFromJson(Map<String, dynamic> json) {
  return _DocumentKindDto.fromJson(json);
}

/// @nodoc
class _$DocumentKindDtoTearOff {
  const _$DocumentKindDtoTearOff();

// ignore: unused_element
  _DocumentKindDto call({@required String id, @required String name}) {
    return _DocumentKindDto(
      id: id,
      name: name,
    );
  }

// ignore: unused_element
  DocumentKindDto fromJson(Map<String, Object> json) {
    return DocumentKindDto.fromJson(json);
  }
}

/// @nodoc
// ignore: unused_element
const $DocumentKindDto = _$DocumentKindDtoTearOff();

/// @nodoc
mixin _$DocumentKindDto {
  String get id;
  String get name;

  Map<String, dynamic> toJson();
  $DocumentKindDtoCopyWith<DocumentKindDto> get copyWith;
}

/// @nodoc
abstract class $DocumentKindDtoCopyWith<$Res> {
  factory $DocumentKindDtoCopyWith(
          DocumentKindDto value, $Res Function(DocumentKindDto) then) =
      _$DocumentKindDtoCopyWithImpl<$Res>;
  $Res call({String id, String name});
}

/// @nodoc
class _$DocumentKindDtoCopyWithImpl<$Res>
    implements $DocumentKindDtoCopyWith<$Res> {
  _$DocumentKindDtoCopyWithImpl(this._value, this._then);

  final DocumentKindDto _value;
  // ignore: unused_field
  final $Res Function(DocumentKindDto) _then;

  @override
  $Res call({
    Object id = freezed,
    Object name = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed ? _value.id : id as String,
      name: name == freezed ? _value.name : name as String,
    ));
  }
}

/// @nodoc
abstract class _$DocumentKindDtoCopyWith<$Res>
    implements $DocumentKindDtoCopyWith<$Res> {
  factory _$DocumentKindDtoCopyWith(
          _DocumentKindDto value, $Res Function(_DocumentKindDto) then) =
      __$DocumentKindDtoCopyWithImpl<$Res>;
  @override
  $Res call({String id, String name});
}

/// @nodoc
class __$DocumentKindDtoCopyWithImpl<$Res>
    extends _$DocumentKindDtoCopyWithImpl<$Res>
    implements _$DocumentKindDtoCopyWith<$Res> {
  __$DocumentKindDtoCopyWithImpl(
      _DocumentKindDto _value, $Res Function(_DocumentKindDto) _then)
      : super(_value, (v) => _then(v as _DocumentKindDto));

  @override
  _DocumentKindDto get _value => super._value as _DocumentKindDto;

  @override
  $Res call({
    Object id = freezed,
    Object name = freezed,
  }) {
    return _then(_DocumentKindDto(
      id: id == freezed ? _value.id : id as String,
      name: name == freezed ? _value.name : name as String,
    ));
  }
}

@JsonSerializable()

/// @nodoc
class _$_DocumentKindDto extends _DocumentKindDto {
  const _$_DocumentKindDto({@required this.id, @required this.name})
      : assert(id != null),
        assert(name != null),
        super._();

  factory _$_DocumentKindDto.fromJson(Map<String, dynamic> json) =>
      _$_$_DocumentKindDtoFromJson(json);

  @override
  final String id;
  @override
  final String name;

  @override
  String toString() {
    return 'DocumentKindDto(id: $id, name: $name)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _DocumentKindDto &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(name);

  @override
  _$DocumentKindDtoCopyWith<_DocumentKindDto> get copyWith =>
      __$DocumentKindDtoCopyWithImpl<_DocumentKindDto>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_DocumentKindDtoToJson(this);
  }
}

abstract class _DocumentKindDto extends DocumentKindDto {
  const _DocumentKindDto._() : super._();
  const factory _DocumentKindDto({@required String id, @required String name}) =
      _$_DocumentKindDto;

  factory _DocumentKindDto.fromJson(Map<String, dynamic> json) =
      _$_DocumentKindDto.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  _$DocumentKindDtoCopyWith<_DocumentKindDto> get copyWith;
}
