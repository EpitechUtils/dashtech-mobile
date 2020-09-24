// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'signin_event.dart';

// **************************************************************************
// SuperEnumGenerator
// **************************************************************************

@immutable
abstract class SigninEvent extends Equatable {
  const SigninEvent(this._type);

  factory SigninEvent.signin({@required Credentials credentials}) = Signin;

  final _SigninEvent _type;

//ignore: missing_return
  R when<R>({@required R Function(Signin) signin}) {
    assert(() {
      if (signin == null) {
        throw 'check for all possible cases';
      }
      return true;
    }());
    switch (this._type) {
      case _SigninEvent.Signin:
        return signin(this as Signin);
    }
  }

//ignore: missing_return
  Future<R> asyncWhen<R>({@required FutureOr<R> Function(Signin) signin}) {
    assert(() {
      if (signin == null) {
        throw 'check for all possible cases';
      }
      return true;
    }());
    switch (this._type) {
      case _SigninEvent.Signin:
        return signin(this as Signin);
    }
  }

  R whenOrElse<R>({R Function(Signin) signin, @required R Function(SigninEvent) orElse}) {
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
    }
    return orElse(this);
  }

  Future<R> asyncWhenOrElse<R>(
      {FutureOr<R> Function(Signin) signin, @required FutureOr<R> Function(SigninEvent) orElse}) {
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
    }
    return orElse(this);
  }

//ignore: missing_return
  Future<void> whenPartial({FutureOr<void> Function(Signin) signin}) {
    assert(() {
      if (signin == null) {
        throw 'provide at least one branch';
      }
      return true;
    }());
    switch (this._type) {
      case _SigninEvent.Signin:
        if (signin == null) break;
        return signin(this as Signin);
    }
  }

  @override
  List get props => const [];
}

@immutable
class Signin extends SigninEvent {
  const Signin({@required this.credentials}) : super(_SigninEvent.Signin);

  final Credentials credentials;

  @override
  String toString() => 'Signin(credentials:${this.credentials})';
  @override
  List get props => [credentials];
}
