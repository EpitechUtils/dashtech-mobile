// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_event.dart';

// **************************************************************************
// SuperEnumGenerator
// **************************************************************************

@immutable
abstract class AuthEvent extends Equatable {
  const AuthEvent(this._type);

  factory AuthEvent.appStarted() = AppStarted;

  factory AuthEvent.logout() = Logout;

  factory AuthEvent.loggedIn({@required ProfileModel authProfile}) = LoggedIn;

  final _AuthEvent _type;

//ignore: missing_return
  R when<R>(
      {@required R Function(AppStarted) appStarted,
      @required R Function(Logout) logout,
      @required R Function(LoggedIn) loggedIn}) {
    assert(() {
      if (appStarted == null || logout == null || loggedIn == null) {
        throw 'check for all possible cases';
      }
      return true;
    }());
    switch (this._type) {
      case _AuthEvent.AppStarted:
        return appStarted(this as AppStarted);
      case _AuthEvent.Logout:
        return logout(this as Logout);
      case _AuthEvent.LoggedIn:
        return loggedIn(this as LoggedIn);
    }
  }

//ignore: missing_return
  Future<R> asyncWhen<R>(
      {@required FutureOr<R> Function(AppStarted) appStarted,
      @required FutureOr<R> Function(Logout) logout,
      @required FutureOr<R> Function(LoggedIn) loggedIn}) {
    assert(() {
      if (appStarted == null || logout == null || loggedIn == null) {
        throw 'check for all possible cases';
      }
      return true;
    }());
    switch (this._type) {
      case _AuthEvent.AppStarted:
        return appStarted(this as AppStarted);
      case _AuthEvent.Logout:
        return logout(this as Logout);
      case _AuthEvent.LoggedIn:
        return loggedIn(this as LoggedIn);
    }
  }

  R whenOrElse<R>(
      {R Function(AppStarted) appStarted,
      R Function(Logout) logout,
      R Function(LoggedIn) loggedIn,
      @required R Function(AuthEvent) orElse}) {
    assert(() {
      if (orElse == null) {
        throw 'Missing orElse case';
      }
      return true;
    }());
    switch (this._type) {
      case _AuthEvent.AppStarted:
        if (appStarted == null) break;
        return appStarted(this as AppStarted);
      case _AuthEvent.Logout:
        if (logout == null) break;
        return logout(this as Logout);
      case _AuthEvent.LoggedIn:
        if (loggedIn == null) break;
        return loggedIn(this as LoggedIn);
    }
    return orElse(this);
  }

  Future<R> asyncWhenOrElse<R>(
      {FutureOr<R> Function(AppStarted) appStarted,
      FutureOr<R> Function(Logout) logout,
      FutureOr<R> Function(LoggedIn) loggedIn,
      @required FutureOr<R> Function(AuthEvent) orElse}) {
    assert(() {
      if (orElse == null) {
        throw 'Missing orElse case';
      }
      return true;
    }());
    switch (this._type) {
      case _AuthEvent.AppStarted:
        if (appStarted == null) break;
        return appStarted(this as AppStarted);
      case _AuthEvent.Logout:
        if (logout == null) break;
        return logout(this as Logout);
      case _AuthEvent.LoggedIn:
        if (loggedIn == null) break;
        return loggedIn(this as LoggedIn);
    }
    return orElse(this);
  }

//ignore: missing_return
  Future<void> whenPartial(
      {FutureOr<void> Function(AppStarted) appStarted,
      FutureOr<void> Function(Logout) logout,
      FutureOr<void> Function(LoggedIn) loggedIn}) {
    assert(() {
      if (appStarted == null && logout == null && loggedIn == null) {
        throw 'provide at least one branch';
      }
      return true;
    }());
    switch (this._type) {
      case _AuthEvent.AppStarted:
        if (appStarted == null) break;
        return appStarted(this as AppStarted);
      case _AuthEvent.Logout:
        if (logout == null) break;
        return logout(this as Logout);
      case _AuthEvent.LoggedIn:
        if (loggedIn == null) break;
        return loggedIn(this as LoggedIn);
    }
  }

  @override
  List get props => const [];
}

@immutable
class AppStarted extends AuthEvent {
  const AppStarted._() : super(_AuthEvent.AppStarted);

  factory AppStarted() {
    _instance ??= const AppStarted._();
    return _instance;
  }

  static AppStarted _instance;
}

@immutable
class Logout extends AuthEvent {
  const Logout._() : super(_AuthEvent.Logout);

  factory Logout() {
    _instance ??= const Logout._();
    return _instance;
  }

  static Logout _instance;
}

@immutable
class LoggedIn extends AuthEvent {
  const LoggedIn({@required this.authProfile}) : super(_AuthEvent.LoggedIn);

  final ProfileModel authProfile;

  @override
  String toString() => 'LoggedIn(authProfile:${this.authProfile})';
  @override
  List get props => [authProfile];
}
