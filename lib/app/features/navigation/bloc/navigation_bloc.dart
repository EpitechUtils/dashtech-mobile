import 'package:epitech_intranet_mobile/app/features/dashboard/business/use_cases/find_week_activities_usecase.dart';
import 'package:epitech_intranet_mobile/app/features/navigation/bloc/navigation_event.dart';
import 'package:epitech_intranet_mobile/app/features/navigation/bloc/navigation_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
@lazySingleton
class NavigationBloc extends Bloc<NavigationEvent, NavigationState> {
  final FindWeekActivitiesUseCase findWeekActivitiesUseCase;

  NavigationBloc({this.findWeekActivitiesUseCase}) : super(NavigationState.init());

  @override
  Stream<NavigationState> mapEventToState(NavigationEvent event) async* {
    yield* event.when(
      init: (e) => _mapInitToState(),
      loading: (e) => _mapLoadingToState(),
      goHome: (e) => _mapGoHomeToState(e),
      goPlanning: (e) => _mapGoPlanningToState(e),
      goNotifications: (e) => _mapGoNotificationsToState(e),
      goSettings: (e) => _mapGoSettingsToState(e),
    );
  }

  Stream<NavigationState> _mapInitToState() async* {
    yield NavigationState.init();
  }

  Stream<NavigationState> _mapLoadingToState() async* {
    yield NavigationState.loading();
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
