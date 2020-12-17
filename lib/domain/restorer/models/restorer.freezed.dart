// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'restorer.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
class _$RestorerTearOff {
  const _$RestorerTearOff();

// ignore: unused_element
  _Restorer call({@required String id, String adeliNumber}) {
    return _Restorer(
      id: id,
      adeliNumber: adeliNumber,
    );
  }
}

/// @nodoc
// ignore: unused_element
const $Restorer = _$RestorerTearOff();

/// @nodoc
mixin _$Restorer {
  String get id;
  String get adeliNumber;

  $RestorerCopyWith<Restorer> get copyWith;
}

/// @nodoc
abstract class $RestorerCopyWith<$Res> {
  factory $RestorerCopyWith(Restorer value, $Res Function(Restorer) then) =
      _$RestorerCopyWithImpl<$Res>;
  $Res call({String id, String adeliNumber});
}

/// @nodoc
class _$RestorerCopyWithImpl<$Res> implements $RestorerCopyWith<$Res> {
  _$RestorerCopyWithImpl(this._value, this._then);

  final Restorer _value;
  // ignore: unused_field
  final $Res Function(Restorer) _then;

  @override
  $Res call({
    Object id = freezed,
    Object adeliNumber = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed ? _value.id : id as String,
      adeliNumber:
          adeliNumber == freezed ? _value.adeliNumber : adeliNumber as String,
    ));
  }
}

/// @nodoc
abstract class _$RestorerCopyWith<$Res> implements $RestorerCopyWith<$Res> {
  factory _$RestorerCopyWith(_Restorer value, $Res Function(_Restorer) then) =
      __$RestorerCopyWithImpl<$Res>;
  @override
  $Res call({String id, String adeliNumber});
}

/// @nodoc
class __$RestorerCopyWithImpl<$Res> extends _$RestorerCopyWithImpl<$Res>
    implements _$RestorerCopyWith<$Res> {
  __$RestorerCopyWithImpl(_Restorer _value, $Res Function(_Restorer) _then)
      : super(_value, (v) => _then(v as _Restorer));

  @override
  _Restorer get _value => super._value as _Restorer;

  @override
  $Res call({
    Object id = freezed,
    Object adeliNumber = freezed,
  }) {
    return _then(_Restorer(
      id: id == freezed ? _value.id : id as String,
      adeliNumber:
          adeliNumber == freezed ? _value.adeliNumber : adeliNumber as String,
    ));
  }
}

/// @nodoc
class _$_Restorer extends _Restorer {
  const _$_Restorer({@required this.id, this.adeliNumber})
      : assert(id != null),
        super._();

  @override
  final String id;
  @override
  final String adeliNumber;

  @override
  String toString() {
    return 'Restorer(id: $id, adeliNumber: $adeliNumber)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Restorer &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.adeliNumber, adeliNumber) ||
                const DeepCollectionEquality()
                    .equals(other.adeliNumber, adeliNumber)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(adeliNumber);

  @override
  _$RestorerCopyWith<_Restorer> get copyWith =>
      __$RestorerCopyWithImpl<_Restorer>(this, _$identity);
}

abstract class _Restorer extends Restorer {
  const _Restorer._() : super._();
  const factory _Restorer({@required String id, String adeliNumber}) =
      _$_Restorer;

  @override
  String get id;
  @override
  String get adeliNumber;
  @override
  _$RestorerCopyWith<_Restorer> get copyWith;
}
