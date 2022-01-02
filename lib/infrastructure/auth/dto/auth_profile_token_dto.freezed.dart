// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'auth_profile_token_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

AuthProfileTokenDto _$AuthProfileTokenDtoFromJson(Map<String, dynamic> json) {
  return _AuthProfileTokenDto.fromJson(json);
}

/// @nodoc
class _$AuthProfileTokenDtoTearOff {
  const _$AuthProfileTokenDtoTearOff();

  _AuthProfileTokenDto call(
      {required DateTime expirationTime,
      required String accessToken,
      required DateTime refreshExpirationTime,
      required String refreshToken}) {
    return _AuthProfileTokenDto(
      expirationTime: expirationTime,
      accessToken: accessToken,
      refreshExpirationTime: refreshExpirationTime,
      refreshToken: refreshToken,
    );
  }

  AuthProfileTokenDto fromJson(Map<String, Object?> json) {
    return AuthProfileTokenDto.fromJson(json);
  }
}

/// @nodoc
const $AuthProfileTokenDto = _$AuthProfileTokenDtoTearOff();

/// @nodoc
mixin _$AuthProfileTokenDto {
  DateTime get expirationTime => throw _privateConstructorUsedError;
  String get accessToken => throw _privateConstructorUsedError;
  DateTime get refreshExpirationTime => throw _privateConstructorUsedError;
  String get refreshToken => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AuthProfileTokenDtoCopyWith<AuthProfileTokenDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthProfileTokenDtoCopyWith<$Res> {
  factory $AuthProfileTokenDtoCopyWith(
          AuthProfileTokenDto value, $Res Function(AuthProfileTokenDto) then) =
      _$AuthProfileTokenDtoCopyWithImpl<$Res>;
  $Res call(
      {DateTime expirationTime,
      String accessToken,
      DateTime refreshExpirationTime,
      String refreshToken});
}

/// @nodoc
class _$AuthProfileTokenDtoCopyWithImpl<$Res>
    implements $AuthProfileTokenDtoCopyWith<$Res> {
  _$AuthProfileTokenDtoCopyWithImpl(this._value, this._then);

  final AuthProfileTokenDto _value;
  // ignore: unused_field
  final $Res Function(AuthProfileTokenDto) _then;

  @override
  $Res call({
    Object? expirationTime = freezed,
    Object? accessToken = freezed,
    Object? refreshExpirationTime = freezed,
    Object? refreshToken = freezed,
  }) {
    return _then(_value.copyWith(
      expirationTime: expirationTime == freezed
          ? _value.expirationTime
          : expirationTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      accessToken: accessToken == freezed
          ? _value.accessToken
          : accessToken // ignore: cast_nullable_to_non_nullable
              as String,
      refreshExpirationTime: refreshExpirationTime == freezed
          ? _value.refreshExpirationTime
          : refreshExpirationTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      refreshToken: refreshToken == freezed
          ? _value.refreshToken
          : refreshToken // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$AuthProfileTokenDtoCopyWith<$Res>
    implements $AuthProfileTokenDtoCopyWith<$Res> {
  factory _$AuthProfileTokenDtoCopyWith(_AuthProfileTokenDto value,
          $Res Function(_AuthProfileTokenDto) then) =
      __$AuthProfileTokenDtoCopyWithImpl<$Res>;
  @override
  $Res call(
      {DateTime expirationTime,
      String accessToken,
      DateTime refreshExpirationTime,
      String refreshToken});
}

/// @nodoc
class __$AuthProfileTokenDtoCopyWithImpl<$Res>
    extends _$AuthProfileTokenDtoCopyWithImpl<$Res>
    implements _$AuthProfileTokenDtoCopyWith<$Res> {
  __$AuthProfileTokenDtoCopyWithImpl(
      _AuthProfileTokenDto _value, $Res Function(_AuthProfileTokenDto) _then)
      : super(_value, (v) => _then(v as _AuthProfileTokenDto));

  @override
  _AuthProfileTokenDto get _value => super._value as _AuthProfileTokenDto;

  @override
  $Res call({
    Object? expirationTime = freezed,
    Object? accessToken = freezed,
    Object? refreshExpirationTime = freezed,
    Object? refreshToken = freezed,
  }) {
    return _then(_AuthProfileTokenDto(
      expirationTime: expirationTime == freezed
          ? _value.expirationTime
          : expirationTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      accessToken: accessToken == freezed
          ? _value.accessToken
          : accessToken // ignore: cast_nullable_to_non_nullable
              as String,
      refreshExpirationTime: refreshExpirationTime == freezed
          ? _value.refreshExpirationTime
          : refreshExpirationTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      refreshToken: refreshToken == freezed
          ? _value.refreshToken
          : refreshToken // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_AuthProfileTokenDto extends _AuthProfileTokenDto {
  const _$_AuthProfileTokenDto(
      {required this.expirationTime,
      required this.accessToken,
      required this.refreshExpirationTime,
      required this.refreshToken})
      : super._();

  factory _$_AuthProfileTokenDto.fromJson(Map<String, dynamic> json) =>
      _$$_AuthProfileTokenDtoFromJson(json);

  @override
  final DateTime expirationTime;
  @override
  final String accessToken;
  @override
  final DateTime refreshExpirationTime;
  @override
  final String refreshToken;

  @override
  String toString() {
    return 'AuthProfileTokenDto(expirationTime: $expirationTime, accessToken: $accessToken, refreshExpirationTime: $refreshExpirationTime, refreshToken: $refreshToken)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _AuthProfileTokenDto &&
            const DeepCollectionEquality()
                .equals(other.expirationTime, expirationTime) &&
            const DeepCollectionEquality()
                .equals(other.accessToken, accessToken) &&
            const DeepCollectionEquality()
                .equals(other.refreshExpirationTime, refreshExpirationTime) &&
            const DeepCollectionEquality()
                .equals(other.refreshToken, refreshToken));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(expirationTime),
      const DeepCollectionEquality().hash(accessToken),
      const DeepCollectionEquality().hash(refreshExpirationTime),
      const DeepCollectionEquality().hash(refreshToken));

  @JsonKey(ignore: true)
  @override
  _$AuthProfileTokenDtoCopyWith<_AuthProfileTokenDto> get copyWith =>
      __$AuthProfileTokenDtoCopyWithImpl<_AuthProfileTokenDto>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_AuthProfileTokenDtoToJson(this);
  }
}

abstract class _AuthProfileTokenDto extends AuthProfileTokenDto {
  const factory _AuthProfileTokenDto(
      {required DateTime expirationTime,
      required String accessToken,
      required DateTime refreshExpirationTime,
      required String refreshToken}) = _$_AuthProfileTokenDto;
  const _AuthProfileTokenDto._() : super._();

  factory _AuthProfileTokenDto.fromJson(Map<String, dynamic> json) =
      _$_AuthProfileTokenDto.fromJson;

  @override
  DateTime get expirationTime;
  @override
  String get accessToken;
  @override
  DateTime get refreshExpirationTime;
  @override
  String get refreshToken;
  @override
  @JsonKey(ignore: true)
  _$AuthProfileTokenDtoCopyWith<_AuthProfileTokenDto> get copyWith =>
      throw _privateConstructorUsedError;
}
