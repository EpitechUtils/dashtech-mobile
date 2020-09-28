import 'package:epitech_intranet_mobile/app/features/setting/models/setting_model.dart';
import 'package:super_enum/super_enum.dart';

part 'settings_state.g.dart';

@superEnum
enum _SettingsState {
  @object
  Init,
  @object
  Loading,
  @object
  Error,
  @Data(fields: [
    DataField<Map<String, String>>('settings'),
  ])
  Loaded,
}
