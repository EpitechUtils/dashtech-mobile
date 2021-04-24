// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'auth_profile.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

AuthProfile _$AuthProfileFromJson(Map<String, dynamic> json) {
  return _AuthProfile.fromJson(json);
}

/// @nodoc
class _$AuthProfileTearOff {
  const _$AuthProfileTearOff();

  _AuthProfile call(
      {required String id, required String email, required String status}) {
    return _AuthProfile(
      id: id,
      email: email,
      status: status,
    );
  }

  AuthProfile fromJson(Map<String, Object> json) {
    return AuthProfile.fromJson(json);
  }
}

/// @nodoc
const $AuthProfile = _$AuthProfileTearOff();

/// @nodoc
mixin _$AuthProfile {
  String get id => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AuthProfileCopyWith<AuthProfile> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthProfileCopyWith<$Res> {
  factory $AuthProfileCopyWith(
          AuthProfile value, $Res Function(AuthProfile) then) =
      _$AuthProfileCopyWithImpl<$Res>;
  $Res call({String id, String email, String status});
}

/// @nodoc
class _$AuthProfileCopyWithImpl<$Res> implements $AuthProfileCopyWith<$Res> {
  _$AuthProfileCopyWithImpl(this._value, this._then);

  final AuthProfile _value;
  // ignore: unused_field
  final $Res Function(AuthProfile) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? email = freezed,
    Object? status = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      email: email == freezed
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$AuthProfileCopyWith<$Res>
    implements $AuthProfileCopyWith<$Res> {
  factory _$AuthProfileCopyWith(
          _AuthProfile value, $Res Function(_AuthProfile) then) =
      __$AuthProfileCopyWithImpl<$Res>;
  @override
  $Res call({String id, String email, String status});
}

/// @nodoc
class __$AuthProfileCopyWithImpl<$Res> extends _$AuthProfileCopyWithImpl<$Res>
    implements _$AuthProfileCopyWith<$Res> {
  __$AuthProfileCopyWithImpl(
      _AuthProfile _value, $Res Function(_AuthProfile) _then)
      : super(_value, (v) => _then(v as _AuthProfile));

  @override
  _AuthProfile get _value => super._value as _AuthProfile;

  @override
  $Res call({
    Object? id = freezed,
    Object? email = freezed,
    Object? status = freezed,
  }) {
    return _then(_AuthProfile(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      email: email == freezed
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_AuthProfile extends _AuthProfile {
  const _$_AuthProfile(
      {required this.id, required this.email, required this.status})
      : super._();

  factory _$_AuthProfile.fromJson(Map<String, dynamic> json) =>
      _$_$_AuthProfileFromJson(json);

  @override
  final String id;
  @override
  final String email;
  @override
  final String status;

  @override
  String toString() {
    return 'AuthProfile(id: $id, email: $email, status: $status)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _AuthProfile &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.email, email) ||
                const DeepCollectionEquality().equals(other.email, email)) &&
            (identical(other.status, status) ||
                const DeepCollectionEquality().equals(other.status, status)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(email) ^
      const DeepCollectionEquality().hash(status);

  @JsonKey(ignore: true)
  @override
  _$AuthProfileCopyWith<_AuthProfile> get copyWith =>
      __$AuthProfileCopyWithImpl<_AuthProfile>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_AuthProfileToJson(this);
  }
}

abstract class _AuthProfile extends AuthProfile {
  const factory _AuthProfile(
      {required String id,
      required String email,
      required String status}) = _$_AuthProfile;
  const _AuthProfile._() : super._();

  factory _AuthProfile.fromJson(Map<String, dynamic> json) =
      _$_AuthProfile.fromJson;

  @override
  String get id => throw _privateConstructorUsedError;
  @override
  String get email => throw _privateConstructorUsedError;
  @override
  String get status => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$AuthProfileCopyWith<_AuthProfile> get copyWith =>
      throw _privateConstructorUsedError;
}
