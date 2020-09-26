import 'package:epitech_intranet_mobile/app/features/planning/models/planning_activity_model.dart';
import 'package:super_enum/super_enum.dart';

part 'navigation_state.g.dart';

@superEnum
enum _NavigationState {
  @object
  Init,
  @object
  Loading,
  @Data(fields: [
    DataField<Map<String, List<PlanningActivityModel>>>('weekActivities'),
  ])
  Home,
  @object
  Planning,
  @object
  Notifications,
  @object
  Settings,
}
