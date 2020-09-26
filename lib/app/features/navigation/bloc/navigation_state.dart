import 'package:super_enum/super_enum.dart';

part 'navigation_state.g.dart';

@superEnum
enum _NavigationState {
  @object
  Init,
  @object
  Loading,
  @object
  Home,
  @object
  Planning,
  @object
  Notifications,
  @object
  Settings,
}
