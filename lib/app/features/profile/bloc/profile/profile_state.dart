import 'package:super_enum/super_enum.dart';
import 'package:epitech_intranet_mobile/app/features/auth/models/profile_model.dart';

part 'profile_state.g.dart';

@superEnum
enum _ProfileState {
  @object
  Init,
  @object
  Loading,
  @object
  Error,
  @Data(fields: [
    DataField<ProfileModel>('profile'),
  ])
  Loaded,
}
