// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_mode_event.dart';

// **************************************************************************
// SuperEnumGenerator
// **************************************************************************

@immutable
abstract class AuthModeEvent extends Equatable {
  const AuthModeEvent(this._type);

  factory AuthModeEvent.showInit() = ShowInit;

  factory AuthModeEvent.showSigninForm() = ShowSigninForm;

  final _AuthModeEvent _type;

//ignore: missing_return
  R when<R>({@required R Function(ShowInit) showInit, @required R Function(ShowSigninForm) showSigninForm}) {
    assert(() {
      if (showInit == null || showSigninForm == null) {
        throw 'check for all possible cases';
      }
      return true;
    }());
    switch (this._type) {
      case _AuthModeEvent.ShowInit:
        return showInit(this as ShowInit);
      case _AuthModeEvent.ShowSigninForm:
        return showSigninForm(this as ShowSigninForm);
    }
  }

//ignore: missing_return
  Future<R> asyncWhen<R>(
      {@required FutureOr<R> Function(ShowInit) showInit,
      @required FutureOr<R> Function(ShowSigninForm) showSigninForm}) {
    assert(() {
      if (showInit == null || showSigninForm == null) {
        throw 'check for all possible cases';
      }
      return true;
    }());
    switch (this._type) {
      case _AuthModeEvent.ShowInit:
        return showInit(this as ShowInit);
      case _AuthModeEvent.ShowSigninForm:
        return showSigninForm(this as ShowSigninForm);
    }
  }

  R whenOrElse<R>(
      {R Function(ShowInit) showInit,
      R Function(ShowSigninForm) showSigninForm,
      @required R Function(AuthModeEvent) orElse}) {
    assert(() {
      if (orElse == null) {
        throw 'Missing orElse case';
      }
      return true;
    }());
    switch (this._type) {
      case _AuthModeEvent.ShowInit:
        if (showInit == null) break;
        return showInit(this as ShowInit);
      case _AuthModeEvent.ShowSigninForm:
        if (showSigninForm == null) break;
        return showSigninForm(this as ShowSigninForm);
    }
    return orElse(this);
  }

  Future<R> asyncWhenOrElse<R>(
      {FutureOr<R> Function(ShowInit) showInit,
      FutureOr<R> Function(ShowSigninForm) showSigninForm,
      @required FutureOr<R> Function(AuthModeEvent) orElse}) {
    assert(() {
      if (orElse == null) {
        throw 'Missing orElse case';
      }
      return true;
    }());
    switch (this._type) {
      case _AuthModeEvent.ShowInit:
        if (showInit == null) break;
        return showInit(this as ShowInit);
      case _AuthModeEvent.ShowSigninForm:
        if (showSigninForm == null) break;
        return showSigninForm(this as ShowSigninForm);
    }
    return orElse(this);
  }

//ignore: missing_return
  Future<void> whenPartial(
      {FutureOr<void> Function(ShowInit) showInit, FutureOr<void> Function(ShowSigninForm) showSigninForm}) {
    assert(() {
      if (showInit == null && showSigninForm == null) {
        throw 'provide at least one branch';
      }
      return true;
    }());
    switch (this._type) {
      case _AuthModeEvent.ShowInit:
        if (showInit == null) break;
        return showInit(this as ShowInit);
      case _AuthModeEvent.ShowSigninForm:
        if (showSigninForm == null) break;
        return showSigninForm(this as ShowSigninForm);
    }
  }

  @override
  List get props => const [];
}

@immutable
class ShowInit extends AuthModeEvent {
  const ShowInit._() : super(_AuthModeEvent.ShowInit);

  factory ShowInit() {
    _instance ??= const ShowInit._();
    return _instance;
  }

  static ShowInit _instance;
}

@immutable
class ShowSigninForm extends AuthModeEvent {
  const ShowSigninForm._() : super(_AuthModeEvent.ShowSigninForm);

  factory ShowSigninForm() {
    _instance ??= const ShowSigninForm._();
    return _instance;
  }

  static ShowSigninForm _instance;
}
