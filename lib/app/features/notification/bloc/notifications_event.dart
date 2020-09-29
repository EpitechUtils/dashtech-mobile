import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:super_enum/super_enum.dart';

part 'notifications_event.g.dart';

@superEnum
enum _NotificationsEvent {
  @object
  LoadNotifications,
  @Data(fields: [
    DataField<RefreshController>('refreshController'),
  ])
  Refresh,
}
