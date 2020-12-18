// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'auth_profile.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;
AuthProfile _$AuthProfileFromJson(Map<String, dynamic> json) {
  return _AuthProfile.fromJson(json);
}

/// @nodoc
class _$AuthProfileTearOff {
  const _$AuthProfileTearOff();

// ignore: unused_element
  _AuthProfile call(
      {@required String id, @required String email, @required String status}) {
    return _AuthProfile(
      id: id,
      email: email,
      status: status,
    );
  }

// ignore: unused_element
  AuthProfile fromJson(Map<String, Object> json) {
    return AuthProfile.fromJson(json);
  }
}

/// @nodoc
// ignore: unused_element
const $AuthProfile = _$AuthProfileTearOff();

/// @nodoc
mixin _$AuthProfile {
  String get id;
  String get email;
  String get status;

  Map<String, dynamic> toJson();
  $AuthProfileCopyWith<AuthProfile> get copyWith;
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
    Object id = freezed,
    Object email = freezed,
    Object status = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed ? _value.id : id as String,
      email: email == freezed ? _value.email : email as String,
      status: status == freezed ? _value.status : status as String,
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
    Object id = freezed,
    Object email = freezed,
    Object status = freezed,
  }) {
    return _then(_AuthProfile(
      id: id == freezed ? _value.id : id as String,
      email: email == freezed ? _value.email : email as String,
      status: status == freezed ? _value.status : status as String,
    ));
  }
}

@JsonSerializable()

/// @nodoc
class _$_AuthProfile extends _AuthProfile {
  const _$_AuthProfile(
      {@required this.id, @required this.email, @required this.status})
      : assert(id != null),
        assert(email != null),
        assert(status != null),
        super._();

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

  @override
  _$AuthProfileCopyWith<_AuthProfile> get copyWith =>
      __$AuthProfileCopyWithImpl<_AuthProfile>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_AuthProfileToJson(this);
  }
}

abstract class _AuthProfile extends AuthProfile {
  const _AuthProfile._() : super._();
  const factory _AuthProfile(
      {@required String id,
      @required String email,
      @required String status}) = _$_AuthProfile;

  factory _AuthProfile.fromJson(Map<String, dynamic> json) =
      _$_AuthProfile.fromJson;

  @override
  String get id;
  @override
  String get email;
  @override
  String get status;
  @override
  _$AuthProfileCopyWith<_AuthProfile> get copyWith;
}
