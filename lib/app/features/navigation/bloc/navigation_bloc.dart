import 'package:basic_utils/basic_utils.dart';
import 'package:epitech_intranet_mobile/app/core/localization/keys.dart';
import 'package:epitech_intranet_mobile/app/core/utils/toast_utils.dart';
import 'package:epitech_intranet_mobile/app/features/dashboard/business/use_cases/find_week_activities_usecase.dart';
import 'package:epitech_intranet_mobile/app/features/navigation/bloc/navigation_event.dart';
import 'package:epitech_intranet_mobile/app/features/navigation/bloc/navigation_state.dart';
import 'package:epitech_intranet_mobile/app/features/planning/models/planning_activity_model.dart';
import 'package:epitech_intranet_mobile/app/features/profile/bloc/profile/profile_event.dart';
import 'package:epitech_intranet_mobile/injection.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_translate/flutter_translate.dart';
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
    yield NavigationState.loading();
    try {
      final List<PlanningActivityModel> rawActivities = await findWeekActivitiesUseCase();
      final Map<String, List<PlanningActivityModel>> weekActivities = {};
      rawActivities.forEach((activity) {
        String key = activity.start.split(" ")[0];
        if (!weekActivities.containsKey(key)) {
          weekActivities[key] = [];
        }
        weekActivities[key].add(activity);
      });
      print(weekActivities);
      yield NavigationState.home(weekActivities: weekActivities);
    } catch (err) {
      print(err);
      ToastUtils.error(translate(Keys.Httperror_Internal));
      yield NavigationState.home(weekActivities: null);
    }
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
