import 'package:basic_utils/basic_utils.dart';
import 'package:epitech_intranet_mobile/app/features/navigation/bloc/navigation_event.dart';
import 'package:epitech_intranet_mobile/app/features/navigation/bloc/navigation_state.dart';
import 'package:epitech_intranet_mobile/app/features/profile/bloc/profile/profile_event.dart';
import 'package:epitech_intranet_mobile/injection.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';
import 'package:uuid/uuid.dart';

@injectable
@lazySingleton
class NavigationBloc extends Bloc<NavigationEvent, NavigationState> {
  NavigationBloc() : super(NavigationState.home());

  @override
  Stream<NavigationState> mapEventToState(NavigationEvent event) async* {
    yield* event.when(
      goHome: (e) => _mapGoHomeToState(e),
      goPlanning: (e) => _mapGoPlanningToState(e),
      goNotifications: (e) => _mapGoNotificationsToState(e),
      goSettings: (e) => _mapGoSettingsToState(e),
    );
  }

  Stream<NavigationState> _mapGoHomeToState(GoHome e) async* {
    yield NavigationState.home();
  }

  Stream<NavigationState> _mapGoPlanningToState(GoPlanning e) async* {
    yield NavigationState.planning();
  }

  Stream<NavigationState> _mapGoNotificationsToState(GoNotifications e) async* {
    yield NavigationState.notifications();
  }

  Stream<NavigationState> _mapGoSettingsToState(GoSettings e) async* {
    yield NavigationState.settings();
  }
}
