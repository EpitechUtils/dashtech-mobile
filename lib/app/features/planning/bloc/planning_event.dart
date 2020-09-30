import 'package:super_enum/super_enum.dart';

part 'planning_event.g.dart';

@superEnum
enum _PlanningEvent {
  @object
  Init,
  @object
  Loading,
  @object
  ListMonthActivities,
}
