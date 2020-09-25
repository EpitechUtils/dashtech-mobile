import 'package:epitech_intranet_mobile/app/features/auth/models/profile_model.dart';
import 'package:super_enum/super_enum.dart';

part 'auth_mode_state.g.dart';

@superEnum
enum _AuthModeState {
  @object
  Init,
  @Data(fields: [
    DataField<List<ProfileModel>>('profiles'),
  ])
  SigninMode
}
