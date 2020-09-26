import 'package:epitech_intranet_mobile/app/features/planning/models/planning_activity_model.dart';
import 'package:super_enum/super_enum.dart';

part 'dash_activities_state.g.dart';

@superEnum
enum _DashActivitiesState {
  @object
  Init,
  @object
  Loading,
  @Data(fields: [
    DataField<Map<String, List<PlanningActivityModel>>>('weekActivities'),
  ])
  ActivitiesList,
}
