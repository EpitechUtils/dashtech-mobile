// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'health_professional.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
class _$HealthProfessionalTearOff {
  const _$HealthProfessionalTearOff();

// ignore: unused_element
  _HealthProfessional call(
      {@required String firstName,
      @required String lastName,
      @required String job}) {
    return _HealthProfessional(
      firstName: firstName,
      lastName: lastName,
      job: job,
    );
  }
}

/// @nodoc
// ignore: unused_element
const $HealthProfessional = _$HealthProfessionalTearOff();

/// @nodoc
mixin _$HealthProfessional {
  String get firstName;
  String get lastName;
  String get job;

  $HealthProfessionalCopyWith<HealthProfessional> get copyWith;
}

/// @nodoc
abstract class $HealthProfessionalCopyWith<$Res> {
  factory $HealthProfessionalCopyWith(
          HealthProfessional value, $Res Function(HealthProfessional) then) =
      _$HealthProfessionalCopyWithImpl<$Res>;
  $Res call({String firstName, String lastName, String job});
}

/// @nodoc
class _$HealthProfessionalCopyWithImpl<$Res>
    implements $HealthProfessionalCopyWith<$Res> {
  _$HealthProfessionalCopyWithImpl(this._value, this._then);

  final HealthProfessional _value;
  // ignore: unused_field
  final $Res Function(HealthProfessional) _then;

  @override
  $Res call({
    Object firstName = freezed,
    Object lastName = freezed,
    Object job = freezed,
  }) {
    return _then(_value.copyWith(
      firstName: firstName == freezed ? _value.firstName : firstName as String,
      lastName: lastName == freezed ? _value.lastName : lastName as String,
      job: job == freezed ? _value.job : job as String,
    ));
  }
}

/// @nodoc
abstract class _$HealthProfessionalCopyWith<$Res>
    implements $HealthProfessionalCopyWith<$Res> {
  factory _$HealthProfessionalCopyWith(
          _HealthProfessional value, $Res Function(_HealthProfessional) then) =
      __$HealthProfessionalCopyWithImpl<$Res>;
  @override
  $Res call({String firstName, String lastName, String job});
}

/// @nodoc
class __$HealthProfessionalCopyWithImpl<$Res>
    extends _$HealthProfessionalCopyWithImpl<$Res>
    implements _$HealthProfessionalCopyWith<$Res> {
  __$HealthProfessionalCopyWithImpl(
      _HealthProfessional _value, $Res Function(_HealthProfessional) _then)
      : super(_value, (v) => _then(v as _HealthProfessional));

  @override
  _HealthProfessional get _value => super._value as _HealthProfessional;

  @override
  $Res call({
    Object firstName = freezed,
    Object lastName = freezed,
    Object job = freezed,
  }) {
    return _then(_HealthProfessional(
      firstName: firstName == freezed ? _value.firstName : firstName as String,
      lastName: lastName == freezed ? _value.lastName : lastName as String,
      job: job == freezed ? _value.job : job as String,
    ));
  }
}

/// @nodoc
class _$_HealthProfessional extends _HealthProfessional {
  const _$_HealthProfessional(
      {@required this.firstName, @required this.lastName, @required this.job})
      : assert(firstName != null),
        assert(lastName != null),
        assert(job != null),
        super._();

  @override
  final String firstName;
  @override
  final String lastName;
  @override
  final String job;

  @override
  String toString() {
    return 'HealthProfessional(firstName: $firstName, lastName: $lastName, job: $job)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _HealthProfessional &&
            (identical(other.firstName, firstName) ||
                const DeepCollectionEquality()
                    .equals(other.firstName, firstName)) &&
            (identical(other.lastName, lastName) ||
                const DeepCollectionEquality()
                    .equals(other.lastName, lastName)) &&
            (identical(other.job, job) ||
                const DeepCollectionEquality().equals(other.job, job)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(firstName) ^
      const DeepCollectionEquality().hash(lastName) ^
      const DeepCollectionEquality().hash(job);

  @override
  _$HealthProfessionalCopyWith<_HealthProfessional> get copyWith =>
      __$HealthProfessionalCopyWithImpl<_HealthProfessional>(this, _$identity);
}

abstract class _HealthProfessional extends HealthProfessional {
  const _HealthProfessional._() : super._();
  const factory _HealthProfessional(
      {@required String firstName,
      @required String lastName,
      @required String job}) = _$_HealthProfessional;

  @override
  String get firstName;
  @override
  String get lastName;
  @override
  String get job;
  @override
  _$HealthProfessionalCopyWith<_HealthProfessional> get copyWith;
}
