import 'package:epitech_intranet_mobile/app/core/localization/keys.dart';
import 'package:epitech_intranet_mobile/app/shared/utils/language_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_translate/flutter_translate.dart';
import 'package:settings_ui/settings_ui.dart';

import 'abstract/settings_abstract_widget.dart';

class CommonSettingsWidget extends StatefulWidget {
  final Map<String, String> settings;

  CommonSettingsWidget(this.settings);

  State<StatefulWidget> createState() => _CommonSettingsWidget(settings);
}

class _CommonSettingsWidget extends SettingsAbstractWidget {
  _CommonSettingsWidget(Map<String, String> settings) : super(settings);

  @override
  Widget build(BuildContext context) {
    return SettingsSection(
      title: translate(Keys.Settings_Common_Title).toUpperCase(),
      titleTextStyle: TextStyle(
        fontWeight: FontWeight.bold,
        color: Theme.of(context).primaryColor,
      ),
      tiles: [
        SettingsTile(
          enabled: false,
          title: translate(Keys.Settings_Common_Language),
          subtitle:
              LanguageUtils.getDisplayLanguage(Localizations.localeOf(context).toLanguageTag())['name'] + " (System)",
          leading: Icon(Icons.language),
        ),
        SettingsTile(
          title: translate(Keys.Settings_Common_Profile),
          subtitle: 'Test',
          leading: Icon(Icons.person),
          onTap: () {},
        ),
      ],
    );
  }
}
