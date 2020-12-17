// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'auth_profile.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
class _$AuthProfileTearOff {
  const _$AuthProfileTearOff();

// ignore: unused_element
  _AuthProfile call({@required String id, @required String email}) {
    return _AuthProfile(
      id: id,
      email: email,
    );
  }
}

/// @nodoc
// ignore: unused_element
const $AuthProfile = _$AuthProfileTearOff();

/// @nodoc
mixin _$AuthProfile {
  String get id;
  String get email;

  $AuthProfileCopyWith<AuthProfile> get copyWith;
}

/// @nodoc
abstract class $AuthProfileCopyWith<$Res> {
  factory $AuthProfileCopyWith(
          AuthProfile value, $Res Function(AuthProfile) then) =
      _$AuthProfileCopyWithImpl<$Res>;
  $Res call({String id, String email});
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
  }) {
    return _then(_value.copyWith(
      id: id == freezed ? _value.id : id as String,
      email: email == freezed ? _value.email : email as String,
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
  $Res call({String id, String email});
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
  }) {
    return _then(_AuthProfile(
      id: id == freezed ? _value.id : id as String,
      email: email == freezed ? _value.email : email as String,
    ));
  }
}

/// @nodoc
class _$_AuthProfile extends _AuthProfile {
  const _$_AuthProfile({@required this.id, @required this.email})
      : assert(id != null),
        assert(email != null),
        super._();

  @override
  final String id;
  @override
  final String email;

  @override
  String toString() {
    return 'AuthProfile(id: $id, email: $email)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _AuthProfile &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.email, email) ||
                const DeepCollectionEquality().equals(other.email, email)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(email);

  @override
  _$AuthProfileCopyWith<_AuthProfile> get copyWith =>
      __$AuthProfileCopyWithImpl<_AuthProfile>(this, _$identity);
}

abstract class _AuthProfile extends AuthProfile {
  const _AuthProfile._() : super._();
  const factory _AuthProfile({@required String id, @required String email}) =
      _$_AuthProfile;

  @override
  String get id;
  @override
  String get email;
  @override
  _$AuthProfileCopyWith<_AuthProfile> get copyWith;
}
