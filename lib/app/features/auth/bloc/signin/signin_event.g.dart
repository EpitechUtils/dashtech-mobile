// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'signin_event.dart';

// **************************************************************************
// SuperEnumGenerator
// **************************************************************************

@immutable
abstract class SigninEvent extends Equatable {
  const SigninEvent(this._type);

  factory SigninEvent.signin({@required String profileName, @required String autologUrl}) = Signin;

  factory SigninEvent.intranetSignin(
      {@required String profileName, @required GlobalKey<State<StatefulWidget>> globalKey}) = IntranetSignin;

  factory SigninEvent.error({@required String error}) = Error;

  final _SigninEvent _type;

//ignore: missing_return
  R when<R>(
      {@required R Function(Signin) signin,
      @required R Function(IntranetSignin) intranetSignin,
      @required R Function(Error) error}) {
    assert(() {
      if (signin == null || intranetSignin == null || error == null) {
        throw 'check for all possible cases';
      }
      return true;
    }());
    switch (this._type) {
      case _SigninEvent.Signin:
        return signin(this as Signin);
      case _SigninEvent.IntranetSignin:
        return intranetSignin(this as IntranetSignin);
      case _SigninEvent.Error:
        return error(this as Error);
    }
  }

//ignore: missing_return
  Future<R> asyncWhen<R>(
      {@required FutureOr<R> Function(Signin) signin,
      @required FutureOr<R> Function(IntranetSignin) intranetSignin,
      @required FutureOr<R> Function(Error) error}) {
    assert(() {
      if (signin == null || intranetSignin == null || error == null) {
        throw 'check for all possible cases';
      }
      return true;
    }());
    switch (this._type) {
      case _SigninEvent.Signin:
        return signin(this as Signin);
      case _SigninEvent.IntranetSignin:
        return intranetSignin(this as IntranetSignin);
      case _SigninEvent.Error:
        return error(this as Error);
    }
  }

  R whenOrElse<R>(
      {R Function(Signin) signin,
      R Function(IntranetSignin) intranetSignin,
      R Function(Error) error,
      @required R Function(SigninEvent) orElse}) {
    assert(() {
      if (orElse == null) {
        throw 'Missing orElse case';
      }
      return true;
    }());
    switch (this._type) {
      case _SigninEvent.Signin:
        if (signin == null) break;
        return signin(this as Signin);
      case _SigninEvent.IntranetSignin:
        if (intranetSignin == null) break;
        return intranetSignin(this as IntranetSignin);
      case _SigninEvent.Error:
        if (error == null) break;
        return error(this as Error);
    }
    return orElse(this);
  }

  Future<R> asyncWhenOrElse<R>(
      {FutureOr<R> Function(Signin) signin,
      FutureOr<R> Function(IntranetSignin) intranetSignin,
      FutureOr<R> Function(Error) error,
      @required FutureOr<R> Function(SigninEvent) orElse}) {
    assert(() {
      if (orElse == null) {
        throw 'Missing orElse case';
      }
      return true;
    }());
    switch (this._type) {
      case _SigninEvent.Signin:
        if (signin == null) break;
        return signin(this as Signin);
      case _SigninEvent.IntranetSignin:
        if (intranetSignin == null) break;
        return intranetSignin(this as IntranetSignin);
      case _SigninEvent.Error:
        if (error == null) break;
        return error(this as Error);
    }
    return orElse(this);
  }

//ignore: missing_return
  Future<void> whenPartial(
      {FutureOr<void> Function(Signin) signin,
      FutureOr<void> Function(IntranetSignin) intranetSignin,
      FutureOr<void> Function(Error) error}) {
    assert(() {
      if (signin == null && intranetSignin == null && error == null) {
        throw 'provide at least one branch';
      }
      return true;
    }());
    switch (this._type) {
      case _SigninEvent.Signin:
        if (signin == null) break;
        return signin(this as Signin);
      case _SigninEvent.IntranetSignin:
        if (intranetSignin == null) break;
        return intranetSignin(this as IntranetSignin);
      case _SigninEvent.Error:
        if (error == null) break;
        return error(this as Error);
    }
  }

  @override
  List get props => const [];
}

@immutable
class Signin extends SigninEvent {
  const Signin({@required this.profileName, @required this.autologUrl}) : super(_SigninEvent.Signin);

  final String profileName;

  final String autologUrl;

  @override
  String toString() => 'Signin(profileName:${this.profileName},autologUrl:${this.autologUrl})';
  @override
  List get props => [profileName, autologUrl];
}

@immutable
class IntranetSignin extends SigninEvent {
  const IntranetSignin({@required this.profileName, @required this.globalKey}) : super(_SigninEvent.IntranetSignin);

  final String profileName;

  final GlobalKey<State<StatefulWidget>> globalKey;

  @override
  String toString() => 'IntranetSignin(profileName:${this.profileName},globalKey:${this.globalKey})';
  @override
  List get props => [profileName, globalKey];
}

@immutable
class Error extends SigninEvent {
  const Error({@required this.error}) : super(_SigninEvent.Error);

  final String error;

  @override
  String toString() => 'Error(error:${this.error})';
  @override
  List get props => [error];
}
