import 'package:super_enum/super_enum.dart';

part 'navigation_event.g.dart';

@superEnum
enum _NavigationEvent {
  @object
  GoHome,
  @object
  GoPlanning,
  @object
  GoNotifications,
  @object
  GoSettings,
}
