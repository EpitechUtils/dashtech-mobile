import 'package:super_enum/super_enum.dart';

part 'auth_state.g.dart';

@superEnum
enum _AuthState {
  @object
  Authenticated,
  @object
  UnAuthenticated,
  @object
  Uninitialized,
}
