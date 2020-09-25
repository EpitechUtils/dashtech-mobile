import 'package:epitech_intranet_mobile/app/core/utils/device_utils.dart';
import 'package:epitech_intranet_mobile/app/features/auth/models/profile_model.dart';
import 'package:epitech_intranet_mobile/app/features/auth/widgets/webview_intra_auth_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_translate/global.dart';
import 'package:injectable/injectable.dart';
import 'package:epitech_intranet_mobile/app/core/utils/toast_utils.dart';
import 'package:epitech_intranet_mobile/app/features/auth/bloc/auth/auth_bloc.dart';
import 'package:epitech_intranet_mobile/app/features/auth/bloc/auth/auth_event.dart';
import 'package:epitech_intranet_mobile/app/features/auth/bloc/signin/signin_event.dart';
import 'package:epitech_intranet_mobile/app/features/auth/bloc/signin/signin_state.dart';
import 'package:epitech_intranet_mobile/app/features/auth/business/use_cases/signin_usecase.dart';
import 'package:epitech_intranet_mobile/app/features/profile/bloc/profile/profile_bloc.dart';
import 'package:epitech_intranet_mobile/app/features/profile/bloc/profile/profile_event.dart';

@injectable
class SigninBloc extends Bloc<SigninEvent, SigninState> {
  final AuthBloc authBloc;
  final SigninUseCase signinUseCase;
  final ProfileBloc profileBloc;

  SigninBloc({
    @required this.signinUseCase,
    @required this.authBloc,
    @required this.profileBloc,
  }) : super(SigninState.signinInitial());

  @override
  Stream<SigninState> mapEventToState(SigninEvent event) async* {
    yield* event.when(
      signin: (e) => _mapSigninToState(e),
      intranetSignin: (e) => _mapIntranetSigninToState(e),
      error: (e) => _mapErrorToState(e),
    );
  }

  Stream<SigninState> _mapSigninToState(Signin event) async* {
    yield SigninState.signinLoading();
    try {
      final String identifier = (await DeviceUtils.getDeviceDetails())['identifier'];
      final ProfileModel authProfile =
          await signinUseCase(Credentials.fromRaw(event.profileName, event.autologUrl, identifier));
      //authBloc.add(AuthEvent.loggedIn(authProfile: authProfile));
      //profileBloc.add(ProfileEvent.loadProfile(profile: authProfile));
      yield SigninState.signinInitial();
    } catch (failure) {
      ToastUtils.error(failure.message);
      yield SigninState.signinError();
    }
  }

  Stream<SigninState> _mapIntranetSigninToState(IntranetSignin event) async* {
    yield SigninState.signinLoading();
    showModalBottomSheet(
      isDismissible: false,
      isScrollControlled: true,
      context: event.globalKey.currentContext,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      builder: (BuildContext context) => WebviewIntraAuthWidget(event.globalKey, event.profileName),
    );
  }

  Stream<SigninState> _mapErrorToState(Error event) async* {
    ToastUtils.error(translate(event.error));
  }
}
