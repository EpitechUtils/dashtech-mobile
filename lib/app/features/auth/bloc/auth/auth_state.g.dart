// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_state.dart';

// **************************************************************************
// SuperEnumGenerator
// **************************************************************************

@immutable
abstract class AuthState extends Equatable {
  const AuthState(this._type);

  factory AuthState.authenticated() = Authenticated;

  factory AuthState.unAuthenticated() = UnAuthenticated;

  factory AuthState.uninitialized() = Uninitialized;

  final _AuthState _type;

//ignore: missing_return
  R when<R>(
      {@required R Function(Authenticated) authenticated,
      @required R Function(UnAuthenticated) unAuthenticated,
      @required R Function(Uninitialized) uninitialized}) {
    assert(() {
      if (authenticated == null || unAuthenticated == null || uninitialized == null) {
        throw 'check for all possible cases';
      }
      return true;
    }());
    switch (this._type) {
      case _AuthState.Authenticated:
        return authenticated(this as Authenticated);
      case _AuthState.UnAuthenticated:
        return unAuthenticated(this as UnAuthenticated);
      case _AuthState.Uninitialized:
        return uninitialized(this as Uninitialized);
    }
  }

//ignore: missing_return
  Future<R> asyncWhen<R>(
      {@required FutureOr<R> Function(Authenticated) authenticated,
      @required FutureOr<R> Function(UnAuthenticated) unAuthenticated,
      @required FutureOr<R> Function(Uninitialized) uninitialized}) {
    assert(() {
      if (authenticated == null || unAuthenticated == null || uninitialized == null) {
        throw 'check for all possible cases';
      }
      return true;
    }());
    switch (this._type) {
      case _AuthState.Authenticated:
        return authenticated(this as Authenticated);
      case _AuthState.UnAuthenticated:
        return unAuthenticated(this as UnAuthenticated);
      case _AuthState.Uninitialized:
        return uninitialized(this as Uninitialized);
    }
  }

  R whenOrElse<R>(
      {R Function(Authenticated) authenticated,
      R Function(UnAuthenticated) unAuthenticated,
      R Function(Uninitialized) uninitialized,
      @required R Function(AuthState) orElse}) {
    assert(() {
      if (orElse == null) {
        throw 'Missing orElse case';
      }
      return true;
    }());
    switch (this._type) {
      case _AuthState.Authenticated:
        if (authenticated == null) break;
        return authenticated(this as Authenticated);
      case _AuthState.UnAuthenticated:
        if (unAuthenticated == null) break;
        return unAuthenticated(this as UnAuthenticated);
      case _AuthState.Uninitialized:
        if (uninitialized == null) break;
        return uninitialized(this as Uninitialized);
    }
    return orElse(this);
  }

  Future<R> asyncWhenOrElse<R>(
      {FutureOr<R> Function(Authenticated) authenticated,
      FutureOr<R> Function(UnAuthenticated) unAuthenticated,
      FutureOr<R> Function(Uninitialized) uninitialized,
      @required FutureOr<R> Function(AuthState) orElse}) {
    assert(() {
      if (orElse == null) {
        throw 'Missing orElse case';
      }
      return true;
    }());
    switch (this._type) {
      case _AuthState.Authenticated:
        if (authenticated == null) break;
        return authenticated(this as Authenticated);
      case _AuthState.UnAuthenticated:
        if (unAuthenticated == null) break;
        return unAuthenticated(this as UnAuthenticated);
      case _AuthState.Uninitialized:
        if (uninitialized == null) break;
        return uninitialized(this as Uninitialized);
    }
    return orElse(this);
  }

//ignore: missing_return
  Future<void> whenPartial(
      {FutureOr<void> Function(Authenticated) authenticated,
      FutureOr<void> Function(UnAuthenticated) unAuthenticated,
      FutureOr<void> Function(Uninitialized) uninitialized}) {
    assert(() {
      if (authenticated == null && unAuthenticated == null && uninitialized == null) {
        throw 'provide at least one branch';
      }
      return true;
    }());
    switch (this._type) {
      case _AuthState.Authenticated:
        if (authenticated == null) break;
        return authenticated(this as Authenticated);
      case _AuthState.UnAuthenticated:
        if (unAuthenticated == null) break;
        return unAuthenticated(this as UnAuthenticated);
      case _AuthState.Uninitialized:
        if (uninitialized == null) break;
        return uninitialized(this as Uninitialized);
    }
  }

  @override
  List get props => const [];
}

@immutable
class Authenticated extends AuthState {
  const Authenticated._() : super(_AuthState.Authenticated);

  factory Authenticated() {
    _instance ??= const Authenticated._();
    return _instance;
  }

  static Authenticated _instance;
}

@immutable
class UnAuthenticated extends AuthState {
  const UnAuthenticated._() : super(_AuthState.UnAuthenticated);

  factory UnAuthenticated() {
    _instance ??= const UnAuthenticated._();
    return _instance;
  }

  static UnAuthenticated _instance;
}

@immutable
class Uninitialized extends AuthState {
  const Uninitialized._() : super(_AuthState.Uninitialized);

  factory Uninitialized() {
    _instance ??= const Uninitialized._();
    return _instance;
  }

  static Uninitialized _instance;
}
