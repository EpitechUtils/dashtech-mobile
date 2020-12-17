// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'health_professional_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;
HealthProfessionalDto _$HealthProfessionalDtoFromJson(
    Map<String, dynamic> json) {
  return _HealthProfessionalDto.fromJson(json);
}

/// @nodoc
class _$HealthProfessionalDtoTearOff {
  const _$HealthProfessionalDtoTearOff();

// ignore: unused_element
  _HealthProfessionalDto call(
      {@required String firstName,
      @required String lastName,
      @required String job}) {
    return _HealthProfessionalDto(
      firstName: firstName,
      lastName: lastName,
      job: job,
    );
  }

// ignore: unused_element
  HealthProfessionalDto fromJson(Map<String, Object> json) {
    return HealthProfessionalDto.fromJson(json);
  }
}

/// @nodoc
// ignore: unused_element
const $HealthProfessionalDto = _$HealthProfessionalDtoTearOff();

/// @nodoc
mixin _$HealthProfessionalDto {
  String get firstName;
  String get lastName;
  String get job;

  Map<String, dynamic> toJson();
  $HealthProfessionalDtoCopyWith<HealthProfessionalDto> get copyWith;
}

/// @nodoc
abstract class $HealthProfessionalDtoCopyWith<$Res> {
  factory $HealthProfessionalDtoCopyWith(HealthProfessionalDto value,
          $Res Function(HealthProfessionalDto) then) =
      _$HealthProfessionalDtoCopyWithImpl<$Res>;
  $Res call({String firstName, String lastName, String job});
}

/// @nodoc
class _$HealthProfessionalDtoCopyWithImpl<$Res>
    implements $HealthProfessionalDtoCopyWith<$Res> {
  _$HealthProfessionalDtoCopyWithImpl(this._value, this._then);

  final HealthProfessionalDto _value;
  // ignore: unused_field
  final $Res Function(HealthProfessionalDto) _then;

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
abstract class _$HealthProfessionalDtoCopyWith<$Res>
    implements $HealthProfessionalDtoCopyWith<$Res> {
  factory _$HealthProfessionalDtoCopyWith(_HealthProfessionalDto value,
          $Res Function(_HealthProfessionalDto) then) =
      __$HealthProfessionalDtoCopyWithImpl<$Res>;
  @override
  $Res call({String firstName, String lastName, String job});
}

/// @nodoc
class __$HealthProfessionalDtoCopyWithImpl<$Res>
    extends _$HealthProfessionalDtoCopyWithImpl<$Res>
    implements _$HealthProfessionalDtoCopyWith<$Res> {
  __$HealthProfessionalDtoCopyWithImpl(_HealthProfessionalDto _value,
      $Res Function(_HealthProfessionalDto) _then)
      : super(_value, (v) => _then(v as _HealthProfessionalDto));

  @override
  _HealthProfessionalDto get _value => super._value as _HealthProfessionalDto;

  @override
  $Res call({
    Object firstName = freezed,
    Object lastName = freezed,
    Object job = freezed,
  }) {
    return _then(_HealthProfessionalDto(
      firstName: firstName == freezed ? _value.firstName : firstName as String,
      lastName: lastName == freezed ? _value.lastName : lastName as String,
      job: job == freezed ? _value.job : job as String,
    ));
  }
}

@JsonSerializable()

/// @nodoc
class _$_HealthProfessionalDto extends _HealthProfessionalDto {
  const _$_HealthProfessionalDto(
      {@required this.firstName, @required this.lastName, @required this.job})
      : assert(firstName != null),
        assert(lastName != null),
        assert(job != null),
        super._();

  factory _$_HealthProfessionalDto.fromJson(Map<String, dynamic> json) =>
      _$_$_HealthProfessionalDtoFromJson(json);

  @override
  final String firstName;
  @override
  final String lastName;
  @override
  final String job;

  @override
  String toString() {
    return 'HealthProfessionalDto(firstName: $firstName, lastName: $lastName, job: $job)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _HealthProfessionalDto &&
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
  _$HealthProfessionalDtoCopyWith<_HealthProfessionalDto> get copyWith =>
      __$HealthProfessionalDtoCopyWithImpl<_HealthProfessionalDto>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_HealthProfessionalDtoToJson(this);
  }
}

abstract class _HealthProfessionalDto extends HealthProfessionalDto {
  const _HealthProfessionalDto._() : super._();
  const factory _HealthProfessionalDto(
      {@required String firstName,
      @required String lastName,
      @required String job}) = _$_HealthProfessionalDto;

  factory _HealthProfessionalDto.fromJson(Map<String, dynamic> json) =
      _$_HealthProfessionalDto.fromJson;

  @override
  String get firstName;
  @override
  String get lastName;
  @override
  String get job;
  @override
  _$HealthProfessionalDtoCopyWith<_HealthProfessionalDto> get copyWith;
}
