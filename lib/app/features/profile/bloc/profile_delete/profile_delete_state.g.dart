// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_delete_state.dart';

// **************************************************************************
// SuperEnumGenerator
// **************************************************************************

@immutable
abstract class ProfileDeleteState extends Equatable {
  const ProfileDeleteState(this._type);

  factory ProfileDeleteState.init() = Init;

  factory ProfileDeleteState.loading() = Loading;

  factory ProfileDeleteState.deleteSuccess() = DeleteSuccess;

  factory ProfileDeleteState.deleteError({@required String message}) = DeleteError;

  final _ProfileDeleteState _type;

//ignore: missing_return
  R when<R>(
      {@required R Function(Init) init,
      @required R Function(Loading) loading,
      @required R Function(DeleteSuccess) deleteSuccess,
      @required R Function(DeleteError) deleteError}) {
    assert(() {
      if (init == null || loading == null || deleteSuccess == null || deleteError == null) {
        throw 'check for all possible cases';
      }
      return true;
    }());
    switch (this._type) {
      case _ProfileDeleteState.Init:
        return init(this as Init);
      case _ProfileDeleteState.Loading:
        return loading(this as Loading);
      case _ProfileDeleteState.DeleteSuccess:
        return deleteSuccess(this as DeleteSuccess);
      case _ProfileDeleteState.DeleteError:
        return deleteError(this as DeleteError);
    }
  }

//ignore: missing_return
  Future<R> asyncWhen<R>(
      {@required FutureOr<R> Function(Init) init,
      @required FutureOr<R> Function(Loading) loading,
      @required FutureOr<R> Function(DeleteSuccess) deleteSuccess,
      @required FutureOr<R> Function(DeleteError) deleteError}) {
    assert(() {
      if (init == null || loading == null || deleteSuccess == null || deleteError == null) {
        throw 'check for all possible cases';
      }
      return true;
    }());
    switch (this._type) {
      case _ProfileDeleteState.Init:
        return init(this as Init);
      case _ProfileDeleteState.Loading:
        return loading(this as Loading);
      case _ProfileDeleteState.DeleteSuccess:
        return deleteSuccess(this as DeleteSuccess);
      case _ProfileDeleteState.DeleteError:
        return deleteError(this as DeleteError);
    }
  }

  R whenOrElse<R>(
      {R Function(Init) init,
      R Function(Loading) loading,
      R Function(DeleteSuccess) deleteSuccess,
      R Function(DeleteError) deleteError,
      @required R Function(ProfileDeleteState) orElse}) {
    assert(() {
      if (orElse == null) {
        throw 'Missing orElse case';
      }
      return true;
    }());
    switch (this._type) {
      case _ProfileDeleteState.Init:
        if (init == null) break;
        return init(this as Init);
      case _ProfileDeleteState.Loading:
        if (loading == null) break;
        return loading(this as Loading);
      case _ProfileDeleteState.DeleteSuccess:
        if (deleteSuccess == null) break;
        return deleteSuccess(this as DeleteSuccess);
      case _ProfileDeleteState.DeleteError:
        if (deleteError == null) break;
        return deleteError(this as DeleteError);
    }
    return orElse(this);
  }

  Future<R> asyncWhenOrElse<R>(
      {FutureOr<R> Function(Init) init,
      FutureOr<R> Function(Loading) loading,
      FutureOr<R> Function(DeleteSuccess) deleteSuccess,
      FutureOr<R> Function(DeleteError) deleteError,
      @required FutureOr<R> Function(ProfileDeleteState) orElse}) {
    assert(() {
      if (orElse == null) {
        throw 'Missing orElse case';
      }
      return true;
    }());
    switch (this._type) {
      case _ProfileDeleteState.Init:
        if (init == null) break;
        return init(this as Init);
      case _ProfileDeleteState.Loading:
        if (loading == null) break;
        return loading(this as Loading);
      case _ProfileDeleteState.DeleteSuccess:
        if (deleteSuccess == null) break;
        return deleteSuccess(this as DeleteSuccess);
      case _ProfileDeleteState.DeleteError:
        if (deleteError == null) break;
        return deleteError(this as DeleteError);
    }
    return orElse(this);
  }

//ignore: missing_return
  Future<void> whenPartial(
      {FutureOr<void> Function(Init) init,
      FutureOr<void> Function(Loading) loading,
      FutureOr<void> Function(DeleteSuccess) deleteSuccess,
      FutureOr<void> Function(DeleteError) deleteError}) {
    assert(() {
      if (init == null && loading == null && deleteSuccess == null && deleteError == null) {
        throw 'provide at least one branch';
      }
      return true;
    }());
    switch (this._type) {
      case _ProfileDeleteState.Init:
        if (init == null) break;
        return init(this as Init);
      case _ProfileDeleteState.Loading:
        if (loading == null) break;
        return loading(this as Loading);
      case _ProfileDeleteState.DeleteSuccess:
        if (deleteSuccess == null) break;
        return deleteSuccess(this as DeleteSuccess);
      case _ProfileDeleteState.DeleteError:
        if (deleteError == null) break;
        return deleteError(this as DeleteError);
    }
  }

  @override
  List get props => const [];
}

@immutable
class Init extends ProfileDeleteState {
  const Init._() : super(_ProfileDeleteState.Init);

  factory Init() {
    _instance ??= const Init._();
    return _instance;
  }

  static Init _instance;
}

@immutable
class Loading extends ProfileDeleteState {
  const Loading._() : super(_ProfileDeleteState.Loading);

  factory Loading() {
    _instance ??= const Loading._();
    return _instance;
  }

  static Loading _instance;
}

@immutable
class DeleteSuccess extends ProfileDeleteState {
  const DeleteSuccess._() : super(_ProfileDeleteState.DeleteSuccess);

  factory DeleteSuccess() {
    _instance ??= const DeleteSuccess._();
    return _instance;
  }

  static DeleteSuccess _instance;
}

@immutable
class DeleteError extends ProfileDeleteState {
  const DeleteError({@required this.message}) : super(_ProfileDeleteState.DeleteError);

  final String message;

  @override
  String toString() => 'DeleteError(message:${this.message})';
  @override
  List get props => [message];
}
