// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'restorer_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;
RestorerDto _$RestorerDtoFromJson(Map<String, dynamic> json) {
  return _RestorerDto.fromJson(json);
}

/// @nodoc
class _$RestorerDtoTearOff {
  const _$RestorerDtoTearOff();

// ignore: unused_element
  _RestorerDto call({@required String id}) {
    return _RestorerDto(
      id: id,
    );
  }

// ignore: unused_element
  RestorerDto fromJson(Map<String, Object> json) {
    return RestorerDto.fromJson(json);
  }
}

/// @nodoc
// ignore: unused_element
const $RestorerDto = _$RestorerDtoTearOff();

/// @nodoc
mixin _$RestorerDto {
  String get id;

  Map<String, dynamic> toJson();
  $RestorerDtoCopyWith<RestorerDto> get copyWith;
}

/// @nodoc
abstract class $RestorerDtoCopyWith<$Res> {
  factory $RestorerDtoCopyWith(
          RestorerDto value, $Res Function(RestorerDto) then) =
      _$RestorerDtoCopyWithImpl<$Res>;
  $Res call({String id});
}

/// @nodoc
class _$RestorerDtoCopyWithImpl<$Res> implements $RestorerDtoCopyWith<$Res> {
  _$RestorerDtoCopyWithImpl(this._value, this._then);

  final RestorerDto _value;
  // ignore: unused_field
  final $Res Function(RestorerDto) _then;

  @override
  $Res call({
    Object id = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed ? _value.id : id as String,
    ));
  }
}

/// @nodoc
abstract class _$RestorerDtoCopyWith<$Res>
    implements $RestorerDtoCopyWith<$Res> {
  factory _$RestorerDtoCopyWith(
          _RestorerDto value, $Res Function(_RestorerDto) then) =
      __$RestorerDtoCopyWithImpl<$Res>;
  @override
  $Res call({String id});
}

/// @nodoc
class __$RestorerDtoCopyWithImpl<$Res> extends _$RestorerDtoCopyWithImpl<$Res>
    implements _$RestorerDtoCopyWith<$Res> {
  __$RestorerDtoCopyWithImpl(
      _RestorerDto _value, $Res Function(_RestorerDto) _then)
      : super(_value, (v) => _then(v as _RestorerDto));

  @override
  _RestorerDto get _value => super._value as _RestorerDto;

  @override
  $Res call({
    Object id = freezed,
  }) {
    return _then(_RestorerDto(
      id: id == freezed ? _value.id : id as String,
    ));
  }
}

@JsonSerializable()

/// @nodoc
class _$_RestorerDto extends _RestorerDto {
  const _$_RestorerDto({@required this.id})
      : assert(id != null),
        super._();

  factory _$_RestorerDto.fromJson(Map<String, dynamic> json) =>
      _$_$_RestorerDtoFromJson(json);

  @override
  final String id;

  @override
  String toString() {
    return 'RestorerDto(id: $id)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _RestorerDto &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(id);

  @override
  _$RestorerDtoCopyWith<_RestorerDto> get copyWith =>
      __$RestorerDtoCopyWithImpl<_RestorerDto>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_RestorerDtoToJson(this);
  }
}

abstract class _RestorerDto extends RestorerDto {
  const _RestorerDto._() : super._();
  const factory _RestorerDto({@required String id}) = _$_RestorerDto;

  factory _RestorerDto.fromJson(Map<String, dynamic> json) =
      _$_RestorerDto.fromJson;

  @override
  String get id;
  @override
  _$RestorerDtoCopyWith<_RestorerDto> get copyWith;
}
