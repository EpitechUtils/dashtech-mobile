import 'dart:collection';

import 'package:epitech_intranet_mobile/app/core/localization/keys.dart';
import 'package:epitech_intranet_mobile/app/core/utils/toast_utils.dart';
import 'package:epitech_intranet_mobile/app/features/planning/bloc/planning_event.dart';
import 'package:epitech_intranet_mobile/app/features/planning/bloc/planning_state.dart';
import 'package:epitech_intranet_mobile/app/features/planning/business/use_cases/find_week_activities_usecase.dart';
import 'package:epitech_intranet_mobile/app/features/planning/models/planning_activity_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_translate/flutter_translate.dart';
import 'package:injectable/injectable.dart';

@injectable
@lazySingleton
class PlanningBloc extends Bloc<PlanningEvent, PlanningState> {
  final FindWeekActivitiesUseCase findWeekActivitiesUseCase;

  PlanningBloc({this.findWeekActivitiesUseCase}) : super(PlanningState.init());

  @override
  Stream<PlanningState> mapEventToState(PlanningEvent event) async* {
    yield* event.when(
      init: (e) => _mapInitToState(),
      loading: (e) => _mapLoadingToState(),
      listActivities: (e) => _mapListActivitiesToState(e),
    );
  }

  Stream<PlanningState> _mapInitToState() async* {
    yield PlanningState.init();
  }

  Stream<PlanningState> _mapLoadingToState() async* {
    yield PlanningState.loading();
  }

  Stream<PlanningState> _mapListActivitiesToState(ListActivities e) async* {
    yield PlanningState.loading();
    try {
      final SplayTreeMap<String, List<PlanningActivityModel>> weekActivities = await getData();
      yield PlanningState.activitiesList(weekActivities: weekActivities);
    } catch (err) {
      print(err);
      ToastUtils.error(translate(Keys.Httperror_General));
      yield PlanningState.activitiesList(weekActivities: null);
    }
  }

  Future<SplayTreeMap<String, List<PlanningActivityModel>>> getData() async {
    final List<PlanningActivityModel> rawActivities = await findWeekActivitiesUseCase();
    final SplayTreeMap<String, List<PlanningActivityModel>> weekActivities =
        SplayTreeMap<String, List<PlanningActivityModel>>();

    rawActivities.sort((a, b) => DateTime.parse(a.start).compareTo(DateTime.parse(b.start)));
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
