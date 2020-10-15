import 'dart:convert';

import 'package:basic_utils/basic_utils.dart';
import 'package:crypto/crypto.dart';
import 'package:epitech_intranet_mobile/app/core/firebase/firebase_notifications.dart';
import 'package:epitech_intranet_mobile/app/features/auth/bloc/auth/auth_event.dart';
import 'package:epitech_intranet_mobile/app/features/auth/bloc/auth/auth_state.dart';
import 'package:epitech_intranet_mobile/app/features/auth/business/use_cases/logout_usecase.dart';
import 'package:epitech_intranet_mobile/app/features/auth/business/use_cases/register_device_usecase.dart';
import 'package:epitech_intranet_mobile/app/features/profile/bloc/profile/profile_bloc.dart';
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
    final String secureHash = await secureStorage.read(key: 'secureHash');
    if (StringUtils.isNullOrEmpty(uuidVal)) {
      secureStorage.write(key: 'uuid', value: Uuid().v4());
    }

    // Create secure hash
    if (StringUtils.isNullOrEmpty(secureHash)) {
      final bytes = utf8.encode(Uuid().v4());
      final digest = sha512.convert(bytes);
      secureStorage.write(key: 'secureHash', value: digest.toString());
    }

    FirebaseNotifications().listen(uuidVal);
    final String profileId = await secureStorage.read(key: 'profileId');
    await Future.delayed(const Duration(seconds: 5), () {});
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
    await registerDeviceUseCase({'token': event.token, 'deviceUuid': event.deviceUuid});
    print("[DEBUG] Save token.");
  }
}
