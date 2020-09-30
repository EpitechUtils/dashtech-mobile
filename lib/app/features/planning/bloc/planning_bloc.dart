import 'package:epitech_intranet_mobile/app/core/localization/keys.dart';
import 'package:epitech_intranet_mobile/app/core/utils/toast_utils.dart';
import 'package:epitech_intranet_mobile/app/features/planning/bloc/planning_event.dart';
import 'package:epitech_intranet_mobile/app/features/planning/bloc/planning_state.dart';
import 'package:epitech_intranet_mobile/app/features/planning/business/use_cases/find_month_activities_usecase.dart';
import 'package:epitech_intranet_mobile/app/features/planning/models/planning_activity_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_translate/flutter_translate.dart';
import 'package:injectable/injectable.dart';

@injectable
@lazySingleton
class PlanningBloc extends Bloc<PlanningEvent, PlanningState> {
  final FindMonthActivitiesUseCase findMonthActivitiesUseCase;

  PlanningBloc({this.findMonthActivitiesUseCase}) : super(PlanningState.init());

  @override
  Stream<PlanningState> mapEventToState(PlanningEvent event) async* {
    yield* event.when(
      init: (e) => _mapInitToState(),
      loading: (e) => _mapLoadingToState(),
      listMonthActivities: (e) => _mapListMonthActivitiesToState(e),
    );
  }

  Stream<PlanningState> _mapInitToState() async* {
    yield PlanningState.init();
  }

  Stream<PlanningState> _mapLoadingToState() async* {
    yield PlanningState.loading();
  }

  Stream<PlanningState> _mapListMonthActivitiesToState(ListMonthActivities e) async* {
    yield PlanningState.loading();
    try {
      final List<PlanningActivityModel> activities = await findMonthActivitiesUseCase();
      yield PlanningState.activitiesList(activities: activities);
    } catch (err) {
      print(err);
      ToastUtils.error(translate(Keys.Httperror_General));
      yield PlanningState.activitiesList(activities: null);
    }
  }
}
