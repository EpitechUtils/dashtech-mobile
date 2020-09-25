// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_mode_state.dart';

// **************************************************************************
// SuperEnumGenerator
// **************************************************************************

@immutable
abstract class AuthModeState extends Equatable {
  const AuthModeState(this._type);

  factory AuthModeState.init() = Init;

  factory AuthModeState.signinMode({@required List<ProfileModel> profiles}) = SigninMode;

  final _AuthModeState _type;

//ignore: missing_return
  R when<R>({@required R Function(Init) init, @required R Function(SigninMode) signinMode}) {
    assert(() {
      if (init == null || signinMode == null) {
        throw 'check for all possible cases';
      }
      return true;
    }());
    switch (this._type) {
      case _AuthModeState.Init:
        return init(this as Init);
      case _AuthModeState.SigninMode:
        return signinMode(this as SigninMode);
    }
  }

//ignore: missing_return
  Future<R> asyncWhen<R>(
      {@required FutureOr<R> Function(Init) init, @required FutureOr<R> Function(SigninMode) signinMode}) {
    assert(() {
      if (init == null || signinMode == null) {
        throw 'check for all possible cases';
      }
      return true;
    }());
    switch (this._type) {
      case _AuthModeState.Init:
        return init(this as Init);
      case _AuthModeState.SigninMode:
        return signinMode(this as SigninMode);
    }
  }

  R whenOrElse<R>(
      {R Function(Init) init, R Function(SigninMode) signinMode, @required R Function(AuthModeState) orElse}) {
    assert(() {
      if (orElse == null) {
        throw 'Missing orElse case';
      }
      return true;
    }());
    switch (this._type) {
      case _AuthModeState.Init:
        if (init == null) break;
        return init(this as Init);
      case _AuthModeState.SigninMode:
        if (signinMode == null) break;
        return signinMode(this as SigninMode);
    }
    return orElse(this);
  }

  Future<R> asyncWhenOrElse<R>(
      {FutureOr<R> Function(Init) init,
      FutureOr<R> Function(SigninMode) signinMode,
      @required FutureOr<R> Function(AuthModeState) orElse}) {
    assert(() {
      if (orElse == null) {
        throw 'Missing orElse case';
      }
      return true;
    }());
    switch (this._type) {
      case _AuthModeState.Init:
        if (init == null) break;
        return init(this as Init);
      case _AuthModeState.SigninMode:
        if (signinMode == null) break;
        return signinMode(this as SigninMode);
    }
    return orElse(this);
  }

//ignore: missing_return
  Future<void> whenPartial({FutureOr<void> Function(Init) init, FutureOr<void> Function(SigninMode) signinMode}) {
    assert(() {
      if (init == null && signinMode == null) {
        throw 'provide at least one branch';
      }
      return true;
    }());
    switch (this._type) {
      case _AuthModeState.Init:
        if (init == null) break;
        return init(this as Init);
      case _AuthModeState.SigninMode:
        if (signinMode == null) break;
        return signinMode(this as SigninMode);
    }
  }

  @override
  List get props => const [];
}

@immutable
class Init extends AuthModeState {
  const Init._() : super(_AuthModeState.Init);

  factory Init() {
    _instance ??= const Init._();
    return _instance;
  }

  static Init _instance;
}

@immutable
class SigninMode extends AuthModeState {
  const SigninMode({@required this.profiles}) : super(_AuthModeState.SigninMode);

  final List<ProfileModel> profiles;

  @override
  String toString() => 'SigninMode(profiles:${this.profiles})';
  @override
  List get props => [profiles];
}
