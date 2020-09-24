import 'package:super_enum/super_enum.dart';

part 'auth_mode_event.g.dart';

@superEnum
enum _AuthModeEvent {
  @object
  ShowInit,
  @object
  ShowSigninForm,
}
