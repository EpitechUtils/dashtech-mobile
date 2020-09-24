import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:epitech_intranet_mobile/app/core/utils/toast_utils.dart';
import 'package:epitech_intranet_mobile/app/features/auth/bloc/auth/auth_bloc.dart';
import 'package:epitech_intranet_mobile/app/features/auth/bloc/auth/auth_event.dart';
import 'package:epitech_intranet_mobile/app/features/auth/bloc/signin/signin_event.dart';
import 'package:epitech_intranet_mobile/app/features/auth/bloc/signin/signin_state.dart';
import 'package:epitech_intranet_mobile/app/features/auth/business/use_cases/signin_usecase.dart';
import 'package:epitech_intranet_mobile/app/features/auth/models/auth_profile_model.dart';
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
    );
  }

  Stream<SigninState> _mapSigninToState(Signin event) async* {
    yield SigninState.signinLoading();
    try {
      final AuthProfileModel authProfile = await signinUseCase(event.credentials);
      authBloc.add(AuthEvent.loggedIn(authProfile: authProfile));
      profileBloc.add(ProfileEvent.loadProfile(profile: authProfile.profile));
      yield SigninState.signinInitial();
    } catch (failure) {
      ToastUtils.error(failure.message);
      yield SigninState.signinError();
    }
  }
}
