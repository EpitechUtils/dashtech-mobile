import 'package:super_enum/super_enum.dart';

part 'auth_mode_state.g.dart';

@superEnum
enum _AuthModeState {
  @object
  Init,
  @Data(fields: [
    DataField<String>('signingUsername'),
  ])
  SigninMode
}
