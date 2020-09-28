import 'package:epitech_intranet_mobile/app/core/localization/keys.dart';
import 'package:epitech_intranet_mobile/app/features/setting/widgets/abstract/settings_abstract_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_translate/flutter_translate.dart';
import 'package:settings_ui/settings_ui.dart';

class NotificationSettingsWidget extends StatefulWidget {
  final Map<String, String> settings;

  NotificationSettingsWidget(this.settings);

  State<StatefulWidget> createState() => _NotificationSettingsWidget(settings);
}

class _NotificationSettingsWidget extends SettingsAbstractWidget {
  _NotificationSettingsWidget(Map<String, String> settings) : super(settings);

  bool _notificationEnabled() {
    return parseSetting(
      Keys.Settings_Notifications_Enable,
      "true",
    ).parseBool();
  }

  bool _parentEnabled(String key, String defaultVal) {
    return parseSetting(
      key,
      defaultVal,
    ).parseBool();
  }

  @override
  Widget build(BuildContext context) {
    return SettingsSection(
      title: translate(Keys.Settings_Notifications_Title).toUpperCase(),
      titleTextStyle: TextStyle(
        fontWeight: FontWeight.bold,
        color: Theme.of(context).primaryColor,
      ),
      tiles: [
        SettingsTile.switchTile(
          title: translate(Keys.Settings_Notifications_Enable),
          leading: Icon(Icons.notifications_off),
          switchValue: _notificationEnabled(),
          onToggle: (bool value) {
            updateSetting<bool>(Keys.Settings_Notifications_Enable, value);
          },
        ),
        SettingsTile.switchTile(
          title: translate(Keys.Settings_Notifications_Activity_Reminder),
          leading: Icon(Icons.schedule),
          enabled: _notificationEnabled(),
          switchValue: parseSetting(
            Keys.Settings_Notifications_Activity_Reminder,
            "true",
          ).parseBool(),
          onToggle: (bool value) {
            updateSetting<bool>(Keys.Settings_Notifications_Activity_Reminder, value);
          },
        ),
        SettingsTile(
          title: translate(Keys.Settings_Notifications_Activity_Reminder_Val),
          enabled: _notificationEnabled() && _parentEnabled(Keys.Settings_Notifications_Activity_Reminder, "true"),
          subtitle: parseSetting(
            Keys.Settings_Notifications_Activity_Reminder_Val,
            '5_min_before',
          ),
          leading: Icon(Icons.watch),
          onTap: () {},
        ),
        SettingsTile.switchTile(
          title: translate(Keys.Settings_Notifications_Project_Reminder),
          enabled: _notificationEnabled(),
          leading: Icon(Icons.work),
          switchValue: parseSetting(
            Keys.Settings_Notifications_Project_Reminder,
            "true",
          ).parseBool(),
          onToggle: (bool value) {
            updateSetting<bool>(Keys.Settings_Notifications_Project_Reminder, value);
          },
        ),
        SettingsTile(
          title: translate(Keys.Settings_Notifications_Project_Reminder_Val),
          enabled: _notificationEnabled() && _parentEnabled(Keys.Settings_Notifications_Project_Reminder, "true"),
          subtitle: parseSetting(
            Keys.Settings_Notifications_Project_Reminder_Val,
            '1_day_before',
          ),
          leading: Icon(Icons.watch),
          onTap: () {},
        ),
      ],
    );
  }
}
