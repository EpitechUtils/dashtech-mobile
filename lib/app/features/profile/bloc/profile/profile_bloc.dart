import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';
import 'package:epitech_intranet_mobile/app/core/utils/toast_utils.dart';
import 'package:epitech_intranet_mobile/app/features/profile/bloc/profile/profile_event.dart';
import 'package:epitech_intranet_mobile/app/features/profile/bloc/profile/profile_state.dart';
import 'package:epitech_intranet_mobile/app/features/profile/business/use_cases/find_profile_usecase.dart';
import 'package:epitech_intranet_mobile/app/features/profile/business/use_cases/register_device_usecase.dart';
import 'package:epitech_intranet_mobile/app/features/auth/models/profile_model.dart';
import 'package:epitech_intranet_mobile/injection.dart';

@injectable
@lazySingleton
class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final FindProfileUseCase findProfileUseCase;
  final RegisterDeviceUseCase registerDeviceUseCase;

  ProfileBloc({
    @required this.findProfileUseCase,
    @required this.registerDeviceUseCase,
  }) : super(ProfileState.init());

  @override
  Stream<ProfileState> mapEventToState(ProfileEvent event) async* {
    yield* event.when(
      loadProfile: (e) => _mapLoadToState(e),
      forceLoadProfile: (e) => _mapForceLoadToState(),
      registerNewDevice: (e) => _mapRegisterNewDeviceToState(e),
    );
  }

  Stream<ProfileState> _mapLoadToState(LoadProfile event) async* {
    yield ProfileState.loaded(profile: event.profile);
  }

  Stream<ProfileState> _mapForceLoadToState() async* {
    yield ProfileState.loading();
    try {
      final ProfileModel profile = await findProfileUseCase();
      yield ProfileState.loaded(profile: profile);
    } catch (failure) {
      ToastUtils.error(failure.message);
      yield ProfileState.error();
    }
  }

  Stream<ProfileState> _mapRegisterNewDeviceToState(RegisterNewDevice event) async* {
    print("Save token");
    /*FlutterSecureStorage secureStorage = getIt<FlutterSecureStorage>();
    String jwtToken = await secureStorage.read(key: 'uuid');
    if (jwtToken == null) {
      print("[WARN] JWToken not found, skipped.");
      return;
    }
    bool result = await registerDeviceUseCase(event.token);
    if (result) {
      print("[DEBUG] Token saved successfully.");
      return;
    }
    print("[DEBUG] Unable to save device token.");*/
  }
}
