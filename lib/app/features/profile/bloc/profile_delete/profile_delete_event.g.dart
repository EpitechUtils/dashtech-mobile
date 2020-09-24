// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_delete_event.dart';

// **************************************************************************
// SuperEnumGenerator
// **************************************************************************

@immutable
abstract class ProfileDeleteEvent extends Equatable {
  const ProfileDeleteEvent(this._type);

  factory ProfileDeleteEvent.deleteProfile() = DeleteProfile;

  final _ProfileDeleteEvent _type;

//ignore: missing_return
  R when<R>({@required R Function(DeleteProfile) deleteProfile}) {
    assert(() {
      if (deleteProfile == null) {
        throw 'check for all possible cases';
      }
      return true;
    }());
    switch (this._type) {
      case _ProfileDeleteEvent.DeleteProfile:
        return deleteProfile(this as DeleteProfile);
    }
  }

//ignore: missing_return
  Future<R> asyncWhen<R>({@required FutureOr<R> Function(DeleteProfile) deleteProfile}) {
    assert(() {
      if (deleteProfile == null) {
        throw 'check for all possible cases';
      }
      return true;
    }());
    switch (this._type) {
      case _ProfileDeleteEvent.DeleteProfile:
        return deleteProfile(this as DeleteProfile);
    }
  }

  R whenOrElse<R>({R Function(DeleteProfile) deleteProfile, @required R Function(ProfileDeleteEvent) orElse}) {
    assert(() {
      if (orElse == null) {
        throw 'Missing orElse case';
      }
      return true;
    }());
    switch (this._type) {
      case _ProfileDeleteEvent.DeleteProfile:
        if (deleteProfile == null) break;
        return deleteProfile(this as DeleteProfile);
    }
    return orElse(this);
  }

  Future<R> asyncWhenOrElse<R>(
      {FutureOr<R> Function(DeleteProfile) deleteProfile, @required FutureOr<R> Function(ProfileDeleteEvent) orElse}) {
    assert(() {
      if (orElse == null) {
        throw 'Missing orElse case';
      }
      return true;
    }());
    switch (this._type) {
      case _ProfileDeleteEvent.DeleteProfile:
        if (deleteProfile == null) break;
        return deleteProfile(this as DeleteProfile);
    }
    return orElse(this);
  }

//ignore: missing_return
  Future<void> whenPartial({FutureOr<void> Function(DeleteProfile) deleteProfile}) {
    assert(() {
      if (deleteProfile == null) {
        throw 'provide at least one branch';
      }
      return true;
    }());
    switch (this._type) {
      case _ProfileDeleteEvent.DeleteProfile:
        if (deleteProfile == null) break;
        return deleteProfile(this as DeleteProfile);
    }
  }

  @override
  List get props => const [];
}

@immutable
class DeleteProfile extends ProfileDeleteEvent {
  const DeleteProfile._() : super(_ProfileDeleteEvent.DeleteProfile);

  factory DeleteProfile() {
    _instance ??= const DeleteProfile._();
    return _instance;
  }

  static DeleteProfile _instance;
}
