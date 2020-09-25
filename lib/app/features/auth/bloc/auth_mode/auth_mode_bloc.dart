import 'dart:convert';

import 'package:epitech_intranet_mobile/app/core/utils/device_utils.dart';
import 'package:epitech_intranet_mobile/app/features/auth/business/use_cases/load_profiles_usecase.dart';
import 'package:epitech_intranet_mobile/app/features/auth/models/profile_model.dart';
import 'package:epitech_intranet_mobile/injection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';
import 'package:epitech_intranet_mobile/app/features/auth/bloc/auth_mode/auth_mode_event.dart';
import 'package:epitech_intranet_mobile/app/features/auth/bloc/auth_mode/auth_mode_state.dart';

@injectable
@lazySingleton
class AuthModeBloc extends Bloc<AuthModeEvent, AuthModeState> {
  final FlutterSecureStorage secureStorage;
  final LoadProfilesUseCase loadProfilesUseCase;

  AuthModeBloc({@required this.secureStorage, @required this.loadProfilesUseCase}) : super(AuthModeState.init());

  @override
  Stream<AuthModeState> mapEventToState(AuthModeEvent event) async* {
    yield* event.when(
      showInit: (_) => _mapShowInitToState(),
      showSigninForm: (_) => _mapShowSigninFormToState(),
    );
  }

  Stream<AuthModeState> _mapShowInitToState() async* {
    yield AuthModeState.init();
  }

  Stream<AuthModeState> _mapShowSigninFormToState() async* {
    try {
      FlutterSecureStorage secureStorage = getIt<FlutterSecureStorage>();
      String deviceId = await secureStorage.read(key: 'uuid');
      final List<ProfileModel> profiles = await loadProfilesUseCase(deviceId);
      profiles.asMap().forEach((key, value) {
        secureStorage.write(key: 'profile' + key.toString(), value: jsonEncode(value));
      });
      yield AuthModeState.signinMode(profiles: profiles);
    } catch (e) {
      yield AuthModeState.signinMode(profiles: []);
    }
  }
}
