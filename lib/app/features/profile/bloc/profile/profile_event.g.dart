// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_event.dart';

// **************************************************************************
// SuperEnumGenerator
// **************************************************************************

@immutable
abstract class ProfileEvent extends Equatable {
  const ProfileEvent(this._type);

  factory ProfileEvent.loadProfile({@required ProfileModel profile}) = LoadProfile;

  factory ProfileEvent.forceLoadProfileAndAccounts() = ForceLoadProfileAndAccounts;

  factory ProfileEvent.forceLoadProfile() = ForceLoadProfile;

  factory ProfileEvent.registerNewDevice({@required String token}) = RegisterNewDevice;

  final _ProfileEvent _type;

//ignore: missing_return
  R when<R>(
      {@required R Function(LoadProfile) loadProfile,
      @required R Function(ForceLoadProfileAndAccounts) forceLoadProfileAndAccounts,
      @required R Function(ForceLoadProfile) forceLoadProfile,
      @required R Function(RegisterNewDevice) registerNewDevice}) {
    assert(() {
      if (loadProfile == null ||
          forceLoadProfileAndAccounts == null ||
          forceLoadProfile == null ||
          registerNewDevice == null) {
        throw 'check for all possible cases';
      }
      return true;
    }());
    switch (this._type) {
      case _ProfileEvent.LoadProfile:
        return loadProfile(this as LoadProfile);
      case _ProfileEvent.ForceLoadProfileAndAccounts:
        return forceLoadProfileAndAccounts(this as ForceLoadProfileAndAccounts);
      case _ProfileEvent.ForceLoadProfile:
        return forceLoadProfile(this as ForceLoadProfile);
      case _ProfileEvent.RegisterNewDevice:
        return registerNewDevice(this as RegisterNewDevice);
    }
  }

//ignore: missing_return
  Future<R> asyncWhen<R>(
      {@required FutureOr<R> Function(LoadProfile) loadProfile,
      @required FutureOr<R> Function(ForceLoadProfileAndAccounts) forceLoadProfileAndAccounts,
      @required FutureOr<R> Function(ForceLoadProfile) forceLoadProfile,
      @required FutureOr<R> Function(RegisterNewDevice) registerNewDevice}) {
    assert(() {
      if (loadProfile == null ||
          forceLoadProfileAndAccounts == null ||
          forceLoadProfile == null ||
          registerNewDevice == null) {
        throw 'check for all possible cases';
      }
      return true;
    }());
    switch (this._type) {
      case _ProfileEvent.LoadProfile:
        return loadProfile(this as LoadProfile);
      case _ProfileEvent.ForceLoadProfileAndAccounts:
        return forceLoadProfileAndAccounts(this as ForceLoadProfileAndAccounts);
      case _ProfileEvent.ForceLoadProfile:
        return forceLoadProfile(this as ForceLoadProfile);
      case _ProfileEvent.RegisterNewDevice:
        return registerNewDevice(this as RegisterNewDevice);
    }
  }

  R whenOrElse<R>(
      {R Function(LoadProfile) loadProfile,
      R Function(ForceLoadProfileAndAccounts) forceLoadProfileAndAccounts,
      R Function(ForceLoadProfile) forceLoadProfile,
      R Function(RegisterNewDevice) registerNewDevice,
      @required R Function(ProfileEvent) orElse}) {
    assert(() {
      if (orElse == null) {
        throw 'Missing orElse case';
      }
      return true;
    }());
    switch (this._type) {
      case _ProfileEvent.LoadProfile:
        if (loadProfile == null) break;
        return loadProfile(this as LoadProfile);
      case _ProfileEvent.ForceLoadProfileAndAccounts:
        if (forceLoadProfileAndAccounts == null) break;
        return forceLoadProfileAndAccounts(this as ForceLoadProfileAndAccounts);
      case _ProfileEvent.ForceLoadProfile:
        if (forceLoadProfile == null) break;
        return forceLoadProfile(this as ForceLoadProfile);
      case _ProfileEvent.RegisterNewDevice:
        if (registerNewDevice == null) break;
        return registerNewDevice(this as RegisterNewDevice);
    }
    return orElse(this);
  }

  Future<R> asyncWhenOrElse<R>(
      {FutureOr<R> Function(LoadProfile) loadProfile,
      FutureOr<R> Function(ForceLoadProfileAndAccounts) forceLoadProfileAndAccounts,
      FutureOr<R> Function(ForceLoadProfile) forceLoadProfile,
      FutureOr<R> Function(RegisterNewDevice) registerNewDevice,
      @required FutureOr<R> Function(ProfileEvent) orElse}) {
    assert(() {
      if (orElse == null) {
        throw 'Missing orElse case';
      }
      return true;
    }());
    switch (this._type) {
      case _ProfileEvent.LoadProfile:
        if (loadProfile == null) break;
        return loadProfile(this as LoadProfile);
      case _ProfileEvent.ForceLoadProfileAndAccounts:
        if (forceLoadProfileAndAccounts == null) break;
        return forceLoadProfileAndAccounts(this as ForceLoadProfileAndAccounts);
      case _ProfileEvent.ForceLoadProfile:
        if (forceLoadProfile == null) break;
        return forceLoadProfile(this as ForceLoadProfile);
      case _ProfileEvent.RegisterNewDevice:
        if (registerNewDevice == null) break;
        return registerNewDevice(this as RegisterNewDevice);
    }
    return orElse(this);
  }

//ignore: missing_return
  Future<void> whenPartial(
      {FutureOr<void> Function(LoadProfile) loadProfile,
      FutureOr<void> Function(ForceLoadProfileAndAccounts) forceLoadProfileAndAccounts,
      FutureOr<void> Function(ForceLoadProfile) forceLoadProfile,
      FutureOr<void> Function(RegisterNewDevice) registerNewDevice}) {
    assert(() {
      if (loadProfile == null &&
          forceLoadProfileAndAccounts == null &&
          forceLoadProfile == null &&
          registerNewDevice == null) {
        throw 'provide at least one branch';
      }
      return true;
    }());
    switch (this._type) {
      case _ProfileEvent.LoadProfile:
        if (loadProfile == null) break;
        return loadProfile(this as LoadProfile);
      case _ProfileEvent.ForceLoadProfileAndAccounts:
        if (forceLoadProfileAndAccounts == null) break;
        return forceLoadProfileAndAccounts(this as ForceLoadProfileAndAccounts);
      case _ProfileEvent.ForceLoadProfile:
        if (forceLoadProfile == null) break;
        return forceLoadProfile(this as ForceLoadProfile);
      case _ProfileEvent.RegisterNewDevice:
        if (registerNewDevice == null) break;
        return registerNewDevice(this as RegisterNewDevice);
    }
  }

  @override
  List get props => const [];
}

@immutable
class LoadProfile extends ProfileEvent {
  const LoadProfile({@required this.profile}) : super(_ProfileEvent.LoadProfile);

  final ProfileModel profile;

  @override
  String toString() => 'LoadProfile(profile:${this.profile})';
  @override
  List get props => [profile];
}

@immutable
class ForceLoadProfileAndAccounts extends ProfileEvent {
  const ForceLoadProfileAndAccounts._() : super(_ProfileEvent.ForceLoadProfileAndAccounts);

  factory ForceLoadProfileAndAccounts() {
    _instance ??= const ForceLoadProfileAndAccounts._();
    return _instance;
  }

  static ForceLoadProfileAndAccounts _instance;
}

@immutable
class ForceLoadProfile extends ProfileEvent {
  const ForceLoadProfile._() : super(_ProfileEvent.ForceLoadProfile);

  factory ForceLoadProfile() {
    _instance ??= const ForceLoadProfile._();
    return _instance;
  }

  static ForceLoadProfile _instance;
}

@immutable
class RegisterNewDevice extends ProfileEvent {
  const RegisterNewDevice({@required this.token}) : super(_ProfileEvent.RegisterNewDevice);

  final String token;

  @override
  String toString() => 'RegisterNewDevice(token:${this.token})';
  @override
  List get props => [token];
}
