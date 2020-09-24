// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'signin_state.dart';

// **************************************************************************
// SuperEnumGenerator
// **************************************************************************

@immutable
abstract class SigninState extends Equatable {
  const SigninState(this._type);

  factory SigninState.signinInitial() = SigninInitial;

  factory SigninState.signinLoading() = SigninLoading;

  factory SigninState.signinError() = SigninError;

  final _SigninState _type;

//ignore: missing_return
  R when<R>(
      {@required R Function(SigninInitial) signinInitial,
      @required R Function(SigninLoading) signinLoading,
      @required R Function(SigninError) signinError}) {
    assert(() {
      if (signinInitial == null || signinLoading == null || signinError == null) {
        throw 'check for all possible cases';
      }
      return true;
    }());
    switch (this._type) {
      case _SigninState.SigninInitial:
        return signinInitial(this as SigninInitial);
      case _SigninState.SigninLoading:
        return signinLoading(this as SigninLoading);
      case _SigninState.SigninError:
        return signinError(this as SigninError);
    }
  }

//ignore: missing_return
  Future<R> asyncWhen<R>(
      {@required FutureOr<R> Function(SigninInitial) signinInitial,
      @required FutureOr<R> Function(SigninLoading) signinLoading,
      @required FutureOr<R> Function(SigninError) signinError}) {
    assert(() {
      if (signinInitial == null || signinLoading == null || signinError == null) {
        throw 'check for all possible cases';
      }
      return true;
    }());
    switch (this._type) {
      case _SigninState.SigninInitial:
        return signinInitial(this as SigninInitial);
      case _SigninState.SigninLoading:
        return signinLoading(this as SigninLoading);
      case _SigninState.SigninError:
        return signinError(this as SigninError);
    }
  }

  R whenOrElse<R>(
      {R Function(SigninInitial) signinInitial,
      R Function(SigninLoading) signinLoading,
      R Function(SigninError) signinError,
      @required R Function(SigninState) orElse}) {
    assert(() {
      if (orElse == null) {
        throw 'Missing orElse case';
      }
      return true;
    }());
    switch (this._type) {
      case _SigninState.SigninInitial:
        if (signinInitial == null) break;
        return signinInitial(this as SigninInitial);
      case _SigninState.SigninLoading:
        if (signinLoading == null) break;
        return signinLoading(this as SigninLoading);
      case _SigninState.SigninError:
        if (signinError == null) break;
        return signinError(this as SigninError);
    }
    return orElse(this);
  }

  Future<R> asyncWhenOrElse<R>(
      {FutureOr<R> Function(SigninInitial) signinInitial,
      FutureOr<R> Function(SigninLoading) signinLoading,
      FutureOr<R> Function(SigninError) signinError,
      @required FutureOr<R> Function(SigninState) orElse}) {
    assert(() {
      if (orElse == null) {
        throw 'Missing orElse case';
      }
      return true;
    }());
    switch (this._type) {
      case _SigninState.SigninInitial:
        if (signinInitial == null) break;
        return signinInitial(this as SigninInitial);
      case _SigninState.SigninLoading:
        if (signinLoading == null) break;
        return signinLoading(this as SigninLoading);
      case _SigninState.SigninError:
        if (signinError == null) break;
        return signinError(this as SigninError);
    }
    return orElse(this);
  }

//ignore: missing_return
  Future<void> whenPartial(
      {FutureOr<void> Function(SigninInitial) signinInitial,
      FutureOr<void> Function(SigninLoading) signinLoading,
      FutureOr<void> Function(SigninError) signinError}) {
    assert(() {
      if (signinInitial == null && signinLoading == null && signinError == null) {
        throw 'provide at least one branch';
      }
      return true;
    }());
    switch (this._type) {
      case _SigninState.SigninInitial:
        if (signinInitial == null) break;
        return signinInitial(this as SigninInitial);
      case _SigninState.SigninLoading:
        if (signinLoading == null) break;
        return signinLoading(this as SigninLoading);
      case _SigninState.SigninError:
        if (signinError == null) break;
        return signinError(this as SigninError);
    }
  }

  @override
  List get props => const [];
}

@immutable
class SigninInitial extends SigninState {
  const SigninInitial._() : super(_SigninState.SigninInitial);

  factory SigninInitial() {
    _instance ??= const SigninInitial._();
    return _instance;
  }

  static SigninInitial _instance;
}

@immutable
class SigninLoading extends SigninState {
  const SigninLoading._() : super(_SigninState.SigninLoading);

  factory SigninLoading() {
    _instance ??= const SigninLoading._();
    return _instance;
  }

  static SigninLoading _instance;
}

@immutable
class SigninError extends SigninState {
  const SigninError._() : super(_SigninState.SigninError);

  factory SigninError() {
    _instance ??= const SigninError._();
    return _instance;
  }

  static SigninError _instance;
}
