import 'package:basic_utils/basic_utils.dart';
import 'package:epitech_intranet_mobile/app/core/firebase/firebase_notifications.dart';
import 'package:epitech_intranet_mobile/app/core/utils/device_utils.dart';
import 'package:epitech_intranet_mobile/app/features/auth/bloc/auth/auth_event.dart';
import 'package:epitech_intranet_mobile/app/features/auth/bloc/auth/auth_state.dart';
import 'package:epitech_intranet_mobile/app/features/auth/business/use_cases/logout_usecase.dart';
import 'package:epitech_intranet_mobile/app/features/auth/business/use_cases/register_device_usecase.dart';
import 'package:epitech_intranet_mobile/app/features/profile/bloc/profile/profile_bloc.dart';
import 'package:epitech_intranet_mobile/app/features/profile/bloc/profile/profile_event.dart';
import 'package:epitech_intranet_mobile/injection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';
import 'package:uuid/uuid.dart';

@injectable
@lazySingleton
class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final FlutterSecureStorage secureStorage;
  final ProfileBloc profileBloc;
  final LogoutUseCase logoutUseCase;
  final RegisterDeviceUseCase registerDeviceUseCase;

  AuthBloc({
    @required this.secureStorage,
    @required this.profileBloc,
    @required this.logoutUseCase,
    @required this.registerDeviceUseCase,
  }) : super(AuthState.uninitialized());

  @override
  Stream<AuthState> mapEventToState(AuthEvent event) async* {
    yield* event.when(
      appStarted: (e) => _mapAppStartedToState(),
      loggedIn: (e) => _mapLoggedInToState(e),
      logout: (e) => _mapLogoutToState(),
      registerNewDevice: (e) => _mapRegisterNewDeviceToState(e),
    );
  }

  Stream<AuthState> _mapAppStartedToState() async* {
    final String uuidVal = await secureStorage.read(key: 'uuid');
    if (StringUtils.isNullOrEmpty(uuidVal)) {
      secureStorage.write(key: 'uuid', value: Uuid().v4());
    }

    FirebaseNotifications().listen(uuidVal);
    final String profileId = await secureStorage.read(key: 'profileId');
    if (StringUtils.isNotNullOrEmpty(profileId)) {
      //profileBloc.add(ProfileEvent.forceLoadProfile());
      yield AuthState.authenticated();
    } else {
      yield AuthState.unAuthenticated();
    }
  }

  Stream<AuthState> _mapLoggedInToState(LoggedIn e) async* {
    secureStorage.write(key: 'profileId', value: e.authProfile.id);
    yield AuthState.authenticated();
  }

  Stream<AuthState> _mapLogoutToState() async* {
    /*try {
      FlutterSecureStorage secureStorage = getIt<FlutterSecureStorage>();
      String identifier = await secureStorage.read(key: 'uuid');
      final bool loggedOut = await logoutUseCase(identifier);
      print("logged out: " + loggedOut.toString());
    } catch (err) {
      print(err);
    }*/
    secureStorage.delete(key: 'profileId');
    yield AuthState.unAuthenticated();
  }

  Stream<AuthState> _mapRegisterNewDeviceToState(RegisterNewDevice event) async* {
    bool result = await registerDeviceUseCase({'token': event.token, 'deviceUuid': event.deviceUuid});
    if (result) {
      print("[DEBUG] Token saved successfully.");
      return;
    }
    print("[DEBUG] Unable to save device token.");
  }
}
