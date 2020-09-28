import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:epitech_intranet_mobile/app/features/profile/bloc/profile/profile_event.dart';
import 'package:epitech_intranet_mobile/app/features/profile/bloc/profile/profile_state.dart';
import 'package:epitech_intranet_mobile/app/features/profile/business/use_cases/find_profile_usecase.dart';

@injectable
@lazySingleton
class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final FindProfileUseCase findProfileUseCase;

  ProfileBloc({
    @required this.findProfileUseCase,
  }) : super(ProfileState.init());

  @override
  Stream<ProfileState> mapEventToState(ProfileEvent event) async* {
    yield* event.when(
      loadProfile: (e) => _mapLoadToState(e),
    );
  }

  Stream<ProfileState> _mapLoadToState(LoadProfile event) async* {
    yield ProfileState.loaded(profile: event.profile);
  }
}
