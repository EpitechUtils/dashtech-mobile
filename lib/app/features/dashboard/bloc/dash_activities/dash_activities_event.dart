import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:super_enum/super_enum.dart';

part 'dash_activities_event.g.dart';

@superEnum
enum _DashActivitiesEvent {
  @object
  Init,
  @object
  Loading,
  @object
  ListActivities,
  @Data(fields: [
    DataField<RefreshController>('refreshController'),
  ])
  Refresh,
}
