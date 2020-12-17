// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'document_kind.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
class _$DocumentKindTearOff {
  const _$DocumentKindTearOff();

// ignore: unused_element
  _DocumentKind call({@required String id, @required String name}) {
    return _DocumentKind(
      id: id,
      name: name,
    );
  }
}

/// @nodoc
// ignore: unused_element
const $DocumentKind = _$DocumentKindTearOff();

/// @nodoc
mixin _$DocumentKind {
  String get id;
  String get name;

  $DocumentKindCopyWith<DocumentKind> get copyWith;
}

/// @nodoc
abstract class $DocumentKindCopyWith<$Res> {
  factory $DocumentKindCopyWith(
          DocumentKind value, $Res Function(DocumentKind) then) =
      _$DocumentKindCopyWithImpl<$Res>;
  $Res call({String id, String name});
}

/// @nodoc
class _$DocumentKindCopyWithImpl<$Res> implements $DocumentKindCopyWith<$Res> {
  _$DocumentKindCopyWithImpl(this._value, this._then);

  final DocumentKind _value;
  // ignore: unused_field
  final $Res Function(DocumentKind) _then;

  @override
  $Res call({
    Object id = freezed,
    Object name = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed ? _value.id : id as String,
      name: name == freezed ? _value.name : name as String,
    ));
  }
}

/// @nodoc
abstract class _$DocumentKindCopyWith<$Res>
    implements $DocumentKindCopyWith<$Res> {
  factory _$DocumentKindCopyWith(
          _DocumentKind value, $Res Function(_DocumentKind) then) =
      __$DocumentKindCopyWithImpl<$Res>;
  @override
  $Res call({String id, String name});
}

/// @nodoc
class __$DocumentKindCopyWithImpl<$Res> extends _$DocumentKindCopyWithImpl<$Res>
    implements _$DocumentKindCopyWith<$Res> {
  __$DocumentKindCopyWithImpl(
      _DocumentKind _value, $Res Function(_DocumentKind) _then)
      : super(_value, (v) => _then(v as _DocumentKind));

  @override
  _DocumentKind get _value => super._value as _DocumentKind;

  @override
  $Res call({
    Object id = freezed,
    Object name = freezed,
  }) {
    return _then(_DocumentKind(
      id: id == freezed ? _value.id : id as String,
      name: name == freezed ? _value.name : name as String,
    ));
  }
}

/// @nodoc
class _$_DocumentKind extends _DocumentKind {
  const _$_DocumentKind({@required this.id, @required this.name})
      : assert(id != null),
        assert(name != null),
        super._();

  @override
  final String id;
  @override
  final String name;

  @override
  String toString() {
    return 'DocumentKind(id: $id, name: $name)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _DocumentKind &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(name);

  @override
  _$DocumentKindCopyWith<_DocumentKind> get copyWith =>
      __$DocumentKindCopyWithImpl<_DocumentKind>(this, _$identity);
}

abstract class _DocumentKind extends DocumentKind {
  const _DocumentKind._() : super._();
  const factory _DocumentKind({@required String id, @required String name}) =
      _$_DocumentKind;

  @override
  String get id;
  @override
  String get name;
  @override
  _$DocumentKindCopyWith<_DocumentKind> get copyWith;
}
