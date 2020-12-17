// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'jwt_payload_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;
JwtPayloadDto _$JwtPayloadDtoFromJson(Map<String, dynamic> json) {
  return _JwtPayloadDto.fromJson(json);
}

/// @nodoc
class _$JwtPayloadDtoTearOff {
  const _$JwtPayloadDtoTearOff();

// ignore: unused_element
  _JwtPayloadDto call({@required String userId, @required String email}) {
    return _JwtPayloadDto(
      userId: userId,
      email: email,
    );
  }

// ignore: unused_element
  JwtPayloadDto fromJson(Map<String, Object> json) {
    return JwtPayloadDto.fromJson(json);
  }
}

/// @nodoc
// ignore: unused_element
const $JwtPayloadDto = _$JwtPayloadDtoTearOff();

/// @nodoc
mixin _$JwtPayloadDto {
  String get userId;
  String get email;

  Map<String, dynamic> toJson();
  $JwtPayloadDtoCopyWith<JwtPayloadDto> get copyWith;
}

/// @nodoc
abstract class $JwtPayloadDtoCopyWith<$Res> {
  factory $JwtPayloadDtoCopyWith(
          JwtPayloadDto value, $Res Function(JwtPayloadDto) then) =
      _$JwtPayloadDtoCopyWithImpl<$Res>;
  $Res call({String userId, String email});
}

/// @nodoc
class _$JwtPayloadDtoCopyWithImpl<$Res>
    implements $JwtPayloadDtoCopyWith<$Res> {
  _$JwtPayloadDtoCopyWithImpl(this._value, this._then);

  final JwtPayloadDto _value;
  // ignore: unused_field
  final $Res Function(JwtPayloadDto) _then;

  @override
  $Res call({
    Object userId = freezed,
    Object email = freezed,
  }) {
    return _then(_value.copyWith(
      userId: userId == freezed ? _value.userId : userId as String,
      email: email == freezed ? _value.email : email as String,
    ));
  }
}

/// @nodoc
abstract class _$JwtPayloadDtoCopyWith<$Res>
    implements $JwtPayloadDtoCopyWith<$Res> {
  factory _$JwtPayloadDtoCopyWith(
          _JwtPayloadDto value, $Res Function(_JwtPayloadDto) then) =
      __$JwtPayloadDtoCopyWithImpl<$Res>;
  @override
  $Res call({String userId, String email});
}

/// @nodoc
class __$JwtPayloadDtoCopyWithImpl<$Res>
    extends _$JwtPayloadDtoCopyWithImpl<$Res>
    implements _$JwtPayloadDtoCopyWith<$Res> {
  __$JwtPayloadDtoCopyWithImpl(
      _JwtPayloadDto _value, $Res Function(_JwtPayloadDto) _then)
      : super(_value, (v) => _then(v as _JwtPayloadDto));

  @override
  _JwtPayloadDto get _value => super._value as _JwtPayloadDto;

  @override
  $Res call({
    Object userId = freezed,
    Object email = freezed,
  }) {
    return _then(_JwtPayloadDto(
      userId: userId == freezed ? _value.userId : userId as String,
      email: email == freezed ? _value.email : email as String,
    ));
  }
}

@JsonSerializable()

/// @nodoc
class _$_JwtPayloadDto extends _JwtPayloadDto {
  const _$_JwtPayloadDto({@required this.userId, @required this.email})
      : assert(userId != null),
        assert(email != null),
        super._();

  factory _$_JwtPayloadDto.fromJson(Map<String, dynamic> json) =>
      _$_$_JwtPayloadDtoFromJson(json);

  @override
  final String userId;
  @override
  final String email;

  @override
  String toString() {
    return 'JwtPayloadDto(userId: $userId, email: $email)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _JwtPayloadDto &&
            (identical(other.userId, userId) ||
                const DeepCollectionEquality().equals(other.userId, userId)) &&
            (identical(other.email, email) ||
                const DeepCollectionEquality().equals(other.email, email)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(userId) ^
      const DeepCollectionEquality().hash(email);

  @override
  _$JwtPayloadDtoCopyWith<_JwtPayloadDto> get copyWith =>
      __$JwtPayloadDtoCopyWithImpl<_JwtPayloadDto>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_JwtPayloadDtoToJson(this);
  }
}

abstract class _JwtPayloadDto extends JwtPayloadDto {
  const _JwtPayloadDto._() : super._();
  const factory _JwtPayloadDto(
      {@required String userId, @required String email}) = _$_JwtPayloadDto;

  factory _JwtPayloadDto.fromJson(Map<String, dynamic> json) =
      _$_JwtPayloadDto.fromJson;

  @override
  String get userId;
  @override
  String get email;
  @override
  _$JwtPayloadDtoCopyWith<_JwtPayloadDto> get copyWith;
}
