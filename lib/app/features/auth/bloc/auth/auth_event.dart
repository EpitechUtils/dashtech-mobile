import 'package:epitech_intranet_mobile/app/features/auth/models/profile_model.dart';
import 'package:super_enum/super_enum.dart';

part 'auth_event.g.dart';

@superEnum
enum _AuthEvent {
  @object
  AppStarted,
  @object
  Logout,
  @Data(fields: [
    DataField<ProfileModel>('authProfile'),
  ])
  LoggedIn,
  @Data(fields: [
    DataField<String>('deviceUuid'),
    DataField<String>('token'),
  ])
  RegisterNewDevice,
}
