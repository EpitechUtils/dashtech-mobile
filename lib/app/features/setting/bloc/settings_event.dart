import 'package:super_enum/super_enum.dart';

part 'settings_event.g.dart';

@superEnum
enum _SettingsEvent {
  @object
  LoadSettings,
  @Data(fields: [
    DataField<String>('setting'),
    DataField<String>('value'),
  ])
  ChangeSetting,
}
