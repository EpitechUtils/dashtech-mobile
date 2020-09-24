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

  AuthModeBloc({@required this.secureStorage}) : super(AuthModeState.init());

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
      final String signingUsername = await secureStorage.read(key: 'email');
      yield AuthModeState.signinMode(signingUsername: signingUsername);
    } catch (e) {
      yield AuthModeState.signinMode(signingUsername: "");
    }
  }
}
