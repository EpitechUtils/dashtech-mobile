import 'package:super_enum/super_enum.dart';
import 'package:epitech_intranet_mobile/app/features/profile/models/profile_model.dart';

part 'profile_event.g.dart';

@superEnum
enum _ProfileEvent {
  @Data(fields: [DataField<ProfileModel>('profile')])
  LoadProfile,
  @object
  ForceLoadProfileAndAccounts,
  @object
  ForceLoadProfile,
  @Data(fields: [DataField<String>('token')])
  RegisterNewDevice,
}
