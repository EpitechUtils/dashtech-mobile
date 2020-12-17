// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'restorer_registration_input.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
class _$RestorerRegistrationInputTearOff {
  const _$RestorerRegistrationInputTearOff();

// ignore: unused_element
  _RestorerRegistrationInput call(
      {@required String firstName,
      @required String lastName,
      @required String email,
      @required String password,
      @required String sponsor}) {
    return _RestorerRegistrationInput(
      firstName: firstName,
      lastName: lastName,
      email: email,
      password: password,
      sponsor: sponsor,
    );
  }
}

/// @nodoc
// ignore: unused_element
const $RestorerRegistrationInput = _$RestorerRegistrationInputTearOff();

/// @nodoc
mixin _$RestorerRegistrationInput {
  String get firstName;
  String get lastName;
  String get email;
  String get password;
  String get sponsor;

  $RestorerRegistrationInputCopyWith<RestorerRegistrationInput> get copyWith;
}

/// @nodoc
abstract class $RestorerRegistrationInputCopyWith<$Res> {
  factory $RestorerRegistrationInputCopyWith(RestorerRegistrationInput value,
          $Res Function(RestorerRegistrationInput) then) =
      _$RestorerRegistrationInputCopyWithImpl<$Res>;
  $Res call(
      {String firstName,
      String lastName,
      String email,
      String password,
      String sponsor});
}

/// @nodoc
class _$RestorerRegistrationInputCopyWithImpl<$Res>
    implements $RestorerRegistrationInputCopyWith<$Res> {
  _$RestorerRegistrationInputCopyWithImpl(this._value, this._then);

  final RestorerRegistrationInput _value;
  // ignore: unused_field
  final $Res Function(RestorerRegistrationInput) _then;

  @override
  $Res call({
    Object firstName = freezed,
    Object lastName = freezed,
    Object email = freezed,
    Object password = freezed,
    Object sponsor = freezed,
  }) {
    return _then(_value.copyWith(
      firstName: firstName == freezed ? _value.firstName : firstName as String,
      lastName: lastName == freezed ? _value.lastName : lastName as String,
      email: email == freezed ? _value.email : email as String,
      password: password == freezed ? _value.password : password as String,
      sponsor: sponsor == freezed ? _value.sponsor : sponsor as String,
    ));
  }
}

/// @nodoc
abstract class _$RestorerRegistrationInputCopyWith<$Res>
    implements $RestorerRegistrationInputCopyWith<$Res> {
  factory _$RestorerRegistrationInputCopyWith(_RestorerRegistrationInput value,
          $Res Function(_RestorerRegistrationInput) then) =
      __$RestorerRegistrationInputCopyWithImpl<$Res>;
  @override
  $Res call(
      {String firstName,
      String lastName,
      String email,
      String password,
      String sponsor});
}

/// @nodoc
class __$RestorerRegistrationInputCopyWithImpl<$Res>
    extends _$RestorerRegistrationInputCopyWithImpl<$Res>
    implements _$RestorerRegistrationInputCopyWith<$Res> {
  __$RestorerRegistrationInputCopyWithImpl(_RestorerRegistrationInput _value,
      $Res Function(_RestorerRegistrationInput) _then)
      : super(_value, (v) => _then(v as _RestorerRegistrationInput));

  @override
  _RestorerRegistrationInput get _value =>
      super._value as _RestorerRegistrationInput;

  @override
  $Res call({
    Object firstName = freezed,
    Object lastName = freezed,
    Object email = freezed,
    Object password = freezed,
    Object sponsor = freezed,
  }) {
    return _then(_RestorerRegistrationInput(
      firstName: firstName == freezed ? _value.firstName : firstName as String,
      lastName: lastName == freezed ? _value.lastName : lastName as String,
      email: email == freezed ? _value.email : email as String,
      password: password == freezed ? _value.password : password as String,
      sponsor: sponsor == freezed ? _value.sponsor : sponsor as String,
    ));
  }
}

/// @nodoc
class _$_RestorerRegistrationInput extends _RestorerRegistrationInput {
  const _$_RestorerRegistrationInput(
      {@required this.firstName,
      @required this.lastName,
      @required this.email,
      @required this.password,
      @required this.sponsor})
      : assert(firstName != null),
        assert(lastName != null),
        assert(email != null),
        assert(password != null),
        assert(sponsor != null),
        super._();

  @override
  final String firstName;
  @override
  final String lastName;
  @override
  final String email;
  @override
  final String password;
  @override
  final String sponsor;

  @override
  String toString() {
    return 'RestorerRegistrationInput(firstName: $firstName, lastName: $lastName, email: $email, password: $password, sponsor: $sponsor)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _RestorerRegistrationInput &&
            (identical(other.firstName, firstName) ||
                const DeepCollectionEquality()
                    .equals(other.firstName, firstName)) &&
            (identical(other.lastName, lastName) ||
                const DeepCollectionEquality()
                    .equals(other.lastName, lastName)) &&
            (identical(other.email, email) ||
                const DeepCollectionEquality().equals(other.email, email)) &&
            (identical(other.password, password) ||
                const DeepCollectionEquality()
                    .equals(other.password, password)) &&
            (identical(other.sponsor, sponsor) ||
                const DeepCollectionEquality().equals(other.sponsor, sponsor)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(firstName) ^
      const DeepCollectionEquality().hash(lastName) ^
      const DeepCollectionEquality().hash(email) ^
      const DeepCollectionEquality().hash(password) ^
      const DeepCollectionEquality().hash(sponsor);

  @override
  _$RestorerRegistrationInputCopyWith<_RestorerRegistrationInput>
      get copyWith =>
          __$RestorerRegistrationInputCopyWithImpl<_RestorerRegistrationInput>(
              this, _$identity);
}

abstract class _RestorerRegistrationInput extends RestorerRegistrationInput {
  const _RestorerRegistrationInput._() : super._();
  const factory _RestorerRegistrationInput(
      {@required String firstName,
      @required String lastName,
      @required String email,
      @required String password,
      @required String sponsor}) = _$_RestorerRegistrationInput;

  @override
  String get firstName;
  @override
  String get lastName;
  @override
  String get email;
  @override
  String get password;
  @override
  String get sponsor;
  @override
  _$RestorerRegistrationInputCopyWith<_RestorerRegistrationInput> get copyWith;
}
