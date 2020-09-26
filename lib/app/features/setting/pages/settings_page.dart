import 'package:epitech_intranet_mobile/app/shared/utils/language_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_translate/global.dart';
import 'package:settings_ui/settings_ui.dart';
import 'package:epitech_intranet_mobile/app/core/localization/keys.dart';

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SettingsList(
      sections: [
        SettingsSection(
          title: translate(Keys.Settings_Common_Title).toUpperCase(),
          titleTextStyle: TextStyle(
            fontWeight: FontWeight.bold,
            color: Theme.of(context).primaryColor,
          ),
          tiles: [
            SettingsTile(
              enabled: false,
              title: translate(Keys.Settings_Common_Language),
              subtitle: LanguageUtils.getDisplayLanguage(Localizations.localeOf(context).toLanguageTag())['name'] +
                  " (System)",
              leading: Icon(Icons.language),
            ),
            SettingsTile(
              title: translate(Keys.Settings_Common_Profile),
              subtitle: 'Test',
              leading: Icon(Icons.person),
              onTap: () {},
            ),
          ],
        ),
        SettingsSection(
          title: translate(Keys.Settings_Notifications_Title).toUpperCase(),
          titleTextStyle: TextStyle(
            fontWeight: FontWeight.bold,
            color: Theme.of(context).primaryColor,
          ),
          tiles: [
            SettingsTile.switchTile(
              title: translate(Keys.Settings_Notifications_Enable),
              leading: Icon(Icons.notifications),
              switchValue: true,
              onToggle: (bool value) {},
            ),
          ],
        ),
      ],
    );
  }

  _buildSettingsTitle(BuildContext context, String text) {
    return Container(
      margin: const EdgeInsets.only(top: 10, bottom: 10),
      child: Text(
        text.toUpperCase(),
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: Theme.of(context).primaryColor,
        ),
      ),
    );
  }
}
