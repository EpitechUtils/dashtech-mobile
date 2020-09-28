import 'package:epitech_intranet_mobile/app/features/setting/bloc/settings_bloc.dart';
import 'package:epitech_intranet_mobile/app/features/setting/bloc/settings_event.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

extension BoolParsing on String {
  bool parseBool() {
    return this.toLowerCase() == 'true';
  }
}

abstract class SettingsAbstractWidget extends State<StatefulWidget> {
  final Map<String, String> settings;

  SettingsAbstractWidget(this.settings);

  @protected
  String parseSetting(String key, String defaultVal) {
    return settings.containsKey(key) ? settings[key] : defaultVal.toString();
  }

  @protected
  void updateSetting<T>(String key, T newVal) {
    BlocProvider.of<SettingsBloc>(context).add(SettingsEvent.changeSetting(setting: key, value: newVal.toString()));
    this.setState(() {
      settings[key] = newVal.toString();
    });
  }

  @protected
  Widget build(BuildContext context);
}
