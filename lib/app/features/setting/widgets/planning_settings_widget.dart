import 'package:epitech_intranet_mobile/app/core/localization/keys.dart';
import 'package:epitech_intranet_mobile/app/features/setting/widgets/abstract/settings_abstract_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_translate/flutter_translate.dart';
import 'package:settings_ui/settings_ui.dart';

class PlanningSettingsWidget extends StatefulWidget {
  final Map<String, String> settings;

  PlanningSettingsWidget(this.settings);

  State<StatefulWidget> createState() => _PlanningSettingsWidget(settings);
}

class _PlanningSettingsWidget extends SettingsAbstractWidget {
  _PlanningSettingsWidget(Map<String, String> settings) : super(settings);

  @override
  Widget build(BuildContext context) {
    return SettingsSection(
      title: translate(Keys.Settings_Planning_Title).toUpperCase(),
      titleTextStyle: TextStyle(
        fontWeight: FontWeight.bold,
        color: Theme.of(context).primaryColor,
      ),
      tiles: [
        SettingsTile.switchTile(
          title: translate(Keys.Settings_Planning_Only_Registered),
          leading: Icon(Icons.calendar_today),
          switchValue: parseSetting(
            Keys.Settings_Planning_Only_Registered,
            "false",
          ).parseBool(),
          onToggle: (bool value) {
            updateSetting<bool>(Keys.Settings_Planning_Only_Registered, value);
            if (value) updateSetting<bool>(Keys.Settings_Planning_Only_Own, !value);
          },
        ),
        SettingsTile.switchTile(
          title: translate(Keys.Settings_Planning_Only_Own),
          leading: Icon(Icons.mic),
          switchValue: parseSetting(
            Keys.Settings_Planning_Only_Own,
            "false",
          ).parseBool(),
          onToggle: (bool value) {
            updateSetting<bool>(Keys.Settings_Planning_Only_Own, value);
            if (value) updateSetting<bool>(Keys.Settings_Planning_Only_Registered, !value);
          },
        ),
        SettingsTile.switchTile(
          title: translate(Keys.Settings_Planning_Cached),
          leading: Icon(Icons.save_alt),
          switchValue: false,
          enabled: false,
          onToggle: (bool value) {},
        ),
      ],
    );
  }
}
