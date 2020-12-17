// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'auth_profile_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;
AuthProfileDto _$AuthProfileDtoFromJson(Map<String, dynamic> json) {
  return _AuthProfileDto.fromJson(json);
}

/// @nodoc
class _$AuthProfileDtoTearOff {
  const _$AuthProfileDtoTearOff();

// ignore: unused_element
  _AuthProfileDto call(
      {@required DateTime expirationTime, @required String accessToken}) {
    return _AuthProfileDto(
      expirationTime: expirationTime,
      accessToken: accessToken,
    );
  }

// ignore: unused_element
  AuthProfileDto fromJson(Map<String, Object> json) {
    return AuthProfileDto.fromJson(json);
  }
}

/// @nodoc
// ignore: unused_element
const $AuthProfileDto = _$AuthProfileDtoTearOff();

/// @nodoc
mixin _$AuthProfileDto {
  DateTime get expirationTime;
  String get accessToken;

  Map<String, dynamic> toJson();
  $AuthProfileDtoCopyWith<AuthProfileDto> get copyWith;
}

/// @nodoc
abstract class $AuthProfileDtoCopyWith<$Res> {
  factory $AuthProfileDtoCopyWith(
          AuthProfileDto value, $Res Function(AuthProfileDto) then) =
      _$AuthProfileDtoCopyWithImpl<$Res>;
  $Res call({DateTime expirationTime, String accessToken});
}

/// @nodoc
class _$AuthProfileDtoCopyWithImpl<$Res>
    implements $AuthProfileDtoCopyWith<$Res> {
  _$AuthProfileDtoCopyWithImpl(this._value, this._then);

  final AuthProfileDto _value;
  // ignore: unused_field
  final $Res Function(AuthProfileDto) _then;

  @override
  $Res call({
    Object expirationTime = freezed,
    Object accessToken = freezed,
  }) {
    return _then(_value.copyWith(
      expirationTime: expirationTime == freezed
          ? _value.expirationTime
          : expirationTime as DateTime,
      accessToken:
          accessToken == freezed ? _value.accessToken : accessToken as String,
    ));
  }
}

/// @nodoc
abstract class _$AuthProfileDtoCopyWith<$Res>
    implements $AuthProfileDtoCopyWith<$Res> {
  factory _$AuthProfileDtoCopyWith(
          _AuthProfileDto value, $Res Function(_AuthProfileDto) then) =
      __$AuthProfileDtoCopyWithImpl<$Res>;
  @override
  $Res call({DateTime expirationTime, String accessToken});
}

/// @nodoc
class __$AuthProfileDtoCopyWithImpl<$Res>
    extends _$AuthProfileDtoCopyWithImpl<$Res>
    implements _$AuthProfileDtoCopyWith<$Res> {
  __$AuthProfileDtoCopyWithImpl(
      _AuthProfileDto _value, $Res Function(_AuthProfileDto) _then)
      : super(_value, (v) => _then(v as _AuthProfileDto));

  @override
  _AuthProfileDto get _value => super._value as _AuthProfileDto;

  @override
  $Res call({
    Object expirationTime = freezed,
    Object accessToken = freezed,
  }) {
    return _then(_AuthProfileDto(
      expirationTime: expirationTime == freezed
          ? _value.expirationTime
          : expirationTime as DateTime,
      accessToken:
          accessToken == freezed ? _value.accessToken : accessToken as String,
    ));
  }
}

@JsonSerializable()

/// @nodoc
class _$_AuthProfileDto extends _AuthProfileDto {
  const _$_AuthProfileDto(
      {@required this.expirationTime, @required this.accessToken})
      : assert(expirationTime != null),
        assert(accessToken != null),
        super._();

  factory _$_AuthProfileDto.fromJson(Map<String, dynamic> json) =>
      _$_$_AuthProfileDtoFromJson(json);

  @override
  final DateTime expirationTime;
  @override
  final String accessToken;

  @override
  String toString() {
    return 'AuthProfileDto(expirationTime: $expirationTime, accessToken: $accessToken)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _AuthProfileDto &&
            (identical(other.expirationTime, expirationTime) ||
                const DeepCollectionEquality()
                    .equals(other.expirationTime, expirationTime)) &&
            (identical(other.accessToken, accessToken) ||
                const DeepCollectionEquality()
                    .equals(other.accessToken, accessToken)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(expirationTime) ^
      const DeepCollectionEquality().hash(accessToken);

  @override
  _$AuthProfileDtoCopyWith<_AuthProfileDto> get copyWith =>
      __$AuthProfileDtoCopyWithImpl<_AuthProfileDto>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_AuthProfileDtoToJson(this);
  }
}

abstract class _AuthProfileDto extends AuthProfileDto {
  const _AuthProfileDto._() : super._();
  const factory _AuthProfileDto(
      {@required DateTime expirationTime,
      @required String accessToken}) = _$_AuthProfileDto;

  factory _AuthProfileDto.fromJson(Map<String, dynamic> json) =
      _$_AuthProfileDto.fromJson;

  @override
  DateTime get expirationTime;
  @override
  String get accessToken;
  @override
  _$AuthProfileDtoCopyWith<_AuthProfileDto> get copyWith;
}
