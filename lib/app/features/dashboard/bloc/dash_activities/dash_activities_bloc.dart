import 'dart:collection';

import 'package:basic_utils/basic_utils.dart';
import 'package:epitech_intranet_mobile/app/core/localization/keys.dart';
import 'package:epitech_intranet_mobile/app/core/utils/toast_utils.dart';
import 'package:epitech_intranet_mobile/app/features/dashboard/bloc/dash_activities/dash_activities_event.dart';
import 'package:epitech_intranet_mobile/app/features/dashboard/bloc/dash_activities/dash_activities_state.dart';
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
class DashActivitiesBloc extends Bloc<DashActivitiesEvent, DashActivitiesState> {
  final FindWeekActivitiesUseCase findWeekActivitiesUseCase;

  DashActivitiesBloc({this.findWeekActivitiesUseCase}) : super(DashActivitiesState.init());

  @override
  Stream<DashActivitiesState> mapEventToState(DashActivitiesEvent event) async* {
    yield* event.when(
      init: (e) => _mapInitToState(),
      loading: (e) => _mapLoadingToState(),
      listActivities: (e) => _mapListActivitiesToState(e),
      refresh: (e) => _mapRefreshToState(e),
    );
  }

  Stream<DashActivitiesState> _mapInitToState() async* {
    yield DashActivitiesState.init();
  }

  Stream<DashActivitiesState> _mapLoadingToState() async* {
    yield DashActivitiesState.loading();
  }

  Stream<DashActivitiesState> _mapListActivitiesToState(ListActivities e) async* {
    yield DashActivitiesState.loading();
    try {
      final SplayTreeMap<String, List<PlanningActivityModel>> weekActivities = await getData();
      yield DashActivitiesState.activitiesList(weekActivities: weekActivities);
    } catch (err) {
      print(err);
      ToastUtils.error(translate(Keys.Httperror_General));
      yield DashActivitiesState.activitiesList(weekActivities: null);
    }
  }

  Stream<DashActivitiesState> _mapRefreshToState(Refresh e) async* {
    try {
      final SplayTreeMap<String, List<PlanningActivityModel>> weekActivities = await getData();
      e.refreshController.refreshCompleted();
      yield DashActivitiesState.activitiesList(weekActivities: weekActivities);
    } catch (err) {
      print(err);
      e.refreshController.refreshFailed();
      ToastUtils.error(translate(Keys.Httperror_General));
    }
  }

  Future<SplayTreeMap<String, List<PlanningActivityModel>>> getData() async {
    final List<PlanningActivityModel> rawActivities = await findWeekActivitiesUseCase();
    final SplayTreeMap<String, List<PlanningActivityModel>> weekActivities =
        SplayTreeMap<String, List<PlanningActivityModel>>();
    rawActivities.forEach((activity) {
      String key = activity.start.split(" ")[0];
      if (!weekActivities.containsKey(key)) {
        weekActivities[key] = [];
      }
      weekActivities[key].add(activity);
    });

    return weekActivities;
  }
}
