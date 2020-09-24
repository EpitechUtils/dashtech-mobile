import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:epitech_intranet_mobile/app/features/auth/bloc/auth/auth_bloc.dart';
import 'package:epitech_intranet_mobile/app/features/profile/bloc/profile_delete/profile_delete_event.dart';
import 'package:epitech_intranet_mobile/app/features/profile/bloc/profile_delete/profile_delete_state.dart';
import 'package:epitech_intranet_mobile/app/features/profile/business/use_cases/delete_profile_usecase.dart';

@injectable
class ProfileDeleteBloc extends Bloc<ProfileDeleteEvent, ProfileDeleteState> {
  final AuthBloc authBloc;
  final DeleteProfileUseCase deleteProfileUseCase;

  ProfileDeleteBloc({
    @required this.deleteProfileUseCase,
    @required this.authBloc,
  }) : super(ProfileDeleteState.init());

  @override
  Stream<ProfileDeleteState> mapEventToState(ProfileDeleteEvent event) async* {
    yield* event.when(
      deleteProfile: (e) => _mapLoadToState(e),
    );
  }

  Stream<ProfileDeleteState> _mapLoadToState(DeleteProfile event) async* {
    yield ProfileDeleteState.loading();
    try {
      await deleteProfileUseCase();
      yield ProfileDeleteState.deleteSuccess();
    } catch (failure) {
      yield ProfileDeleteState.deleteError(message: failure.message);
    }
  }
}
