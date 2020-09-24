import 'package:super_enum/super_enum.dart';
import 'package:epitech_intranet_mobile/app/features/auth/models/auth_profile_model.dart';

part 'auth_event.g.dart';

@superEnum
enum _AuthEvent {
  @object
  AppStarted,
  @object
  Logout,
  @Data(fields: [
    DataField<AuthProfileModel>('authProfile'),
  ])
  LoggedIn,
}
