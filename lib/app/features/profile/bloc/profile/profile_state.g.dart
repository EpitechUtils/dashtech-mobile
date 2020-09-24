// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_state.dart';

// **************************************************************************
// SuperEnumGenerator
// **************************************************************************

@immutable
abstract class ProfileState extends Equatable {
  const ProfileState(this._type);

  factory ProfileState.init() = Init;

  factory ProfileState.loading() = Loading;

  factory ProfileState.error() = Error;

  factory ProfileState.loaded({@required ProfileModel profile}) = Loaded;

  final _ProfileState _type;

//ignore: missing_return
  R when<R>(
      {@required R Function(Init) init,
      @required R Function(Loading) loading,
      @required R Function(Error) error,
      @required R Function(Loaded) loaded}) {
    assert(() {
      if (init == null || loading == null || error == null || loaded == null) {
        throw 'check for all possible cases';
      }
      return true;
    }());
    switch (this._type) {
      case _ProfileState.Init:
        return init(this as Init);
      case _ProfileState.Loading:
        return loading(this as Loading);
      case _ProfileState.Error:
        return error(this as Error);
      case _ProfileState.Loaded:
        return loaded(this as Loaded);
    }
  }

//ignore: missing_return
  Future<R> asyncWhen<R>(
      {@required FutureOr<R> Function(Init) init,
      @required FutureOr<R> Function(Loading) loading,
      @required FutureOr<R> Function(Error) error,
      @required FutureOr<R> Function(Loaded) loaded}) {
    assert(() {
      if (init == null || loading == null || error == null || loaded == null) {
        throw 'check for all possible cases';
      }
      return true;
    }());
    switch (this._type) {
      case _ProfileState.Init:
        return init(this as Init);
      case _ProfileState.Loading:
        return loading(this as Loading);
      case _ProfileState.Error:
        return error(this as Error);
      case _ProfileState.Loaded:
        return loaded(this as Loaded);
    }
  }

  R whenOrElse<R>(
      {R Function(Init) init,
      R Function(Loading) loading,
      R Function(Error) error,
      R Function(Loaded) loaded,
      @required R Function(ProfileState) orElse}) {
    assert(() {
      if (orElse == null) {
        throw 'Missing orElse case';
      }
      return true;
    }());
    switch (this._type) {
      case _ProfileState.Init:
        if (init == null) break;
        return init(this as Init);
      case _ProfileState.Loading:
        if (loading == null) break;
        return loading(this as Loading);
      case _ProfileState.Error:
        if (error == null) break;
        return error(this as Error);
      case _ProfileState.Loaded:
        if (loaded == null) break;
        return loaded(this as Loaded);
    }
    return orElse(this);
  }

  Future<R> asyncWhenOrElse<R>(
      {FutureOr<R> Function(Init) init,
      FutureOr<R> Function(Loading) loading,
      FutureOr<R> Function(Error) error,
      FutureOr<R> Function(Loaded) loaded,
      @required FutureOr<R> Function(ProfileState) orElse}) {
    assert(() {
      if (orElse == null) {
        throw 'Missing orElse case';
      }
      return true;
    }());
    switch (this._type) {
      case _ProfileState.Init:
        if (init == null) break;
        return init(this as Init);
      case _ProfileState.Loading:
        if (loading == null) break;
        return loading(this as Loading);
      case _ProfileState.Error:
        if (error == null) break;
        return error(this as Error);
      case _ProfileState.Loaded:
        if (loaded == null) break;
        return loaded(this as Loaded);
    }
    return orElse(this);
  }

//ignore: missing_return
  Future<void> whenPartial(
      {FutureOr<void> Function(Init) init,
      FutureOr<void> Function(Loading) loading,
      FutureOr<void> Function(Error) error,
      FutureOr<void> Function(Loaded) loaded}) {
    assert(() {
      if (init == null && loading == null && error == null && loaded == null) {
        throw 'provide at least one branch';
      }
      return true;
    }());
    switch (this._type) {
      case _ProfileState.Init:
        if (init == null) break;
        return init(this as Init);
      case _ProfileState.Loading:
        if (loading == null) break;
        return loading(this as Loading);
      case _ProfileState.Error:
        if (error == null) break;
        return error(this as Error);
      case _ProfileState.Loaded:
        if (loaded == null) break;
        return loaded(this as Loaded);
    }
  }

  @override
  List get props => const [];
}

@immutable
class Init extends ProfileState {
  const Init._() : super(_ProfileState.Init);

  factory Init() {
    _instance ??= const Init._();
    return _instance;
  }

  static Init _instance;
}

@immutable
class Loading extends ProfileState {
  const Loading._() : super(_ProfileState.Loading);

  factory Loading() {
    _instance ??= const Loading._();
    return _instance;
  }

  static Loading _instance;
}

@immutable
class Error extends ProfileState {
  const Error._() : super(_ProfileState.Error);

  factory Error() {
    _instance ??= const Error._();
    return _instance;
  }

  static Error _instance;
}

@immutable
class Loaded extends ProfileState {
  const Loaded({@required this.profile}) : super(_ProfileState.Loaded);

  final ProfileModel profile;

  @override
  String toString() => 'Loaded(profile:${this.profile})';
  @override
  List get props => [profile];
}
