import 'package:epitech_intranet_mobile/app/features/planning/models/planning_activity_model.dart';
import 'package:super_enum/super_enum.dart';

part 'planning_state.g.dart';

@superEnum
enum _PlanningState {
  @object
  Init,
  @object
  Loading,
  @Data(fields: [
    DataField<List<PlanningActivityModel>>('activities'), // used for all
  ])
  ActivitiesList,
}
